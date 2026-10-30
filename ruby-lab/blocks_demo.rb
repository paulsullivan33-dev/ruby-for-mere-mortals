# blocks_demo.rb -- blocks and enumerables over the bookshop's stock,
# held in plain Ruby data (the CSV version comes in files_and_data).
books = [
  { title: "The Clockwork Orchard",      author: "M. Ellery",    genre: "Fiction", price: 12.99, stock: 14 },
  { title: "A Field Guide to Clouds",    author: "R. Okafor",    genre: "Science", price: 24.50, stock: 7 },
  { title: "The Night Train to Bexhill", author: "H. Calloway",  genre: "Mystery", price: 13.50, stock: 16 },
  { title: "Gardens of Small Hours",     author: "P. Lindqvist", genre: "Fiction", price: 11.25, stock: 22 },
  { title: "Stars for Beginners",        author: "R. Okafor",    genre: "Science", price: 17.25, stock: 18 },
]

# A block handed to each, printing as it goes.
books.each { |b| puts "#{b[:title]} -- #{b[:stock]} on the shelf" }

# map transforms; select filters; the original array is untouched.
titles   = books.map { |b| b[:title] }
low      = books.select { |b| b[:stock] < 10 }
puts "Titles: #{titles.join(' | ')}"
puts "Running low: #{low.map { |b| b[:title] }.join(', ')}"

# inject/reduce folds a collection into one value.
total_copies = books.sum { |b| b[:stock] }
total_value  = books.sum { |b| b[:price] * b[:stock] }
puts "Copies in this sample: #{total_copies}"
puts format("Shelf value of this sample: %.2f", total_value)

# group_by and sort_by do in one call what loops did in other languages.
by_genre = books.group_by { |b| b[:genre] }
by_genre.each { |genre, shelf| puts "#{genre}: #{shelf.size} titles" }
dearest = books.max_by { |b| b[:price] }
puts "Dearest book: #{dearest[:title]} at #{dearest[:price]}"

# A method that takes a block of its own, with yield.
def announce(count)
  puts "Counting the delivery..."
  (1..count).each { |n| yield n }
  puts "Counted."
end
announce(3) { |n| puts "  box #{n} of 3 checked" }

# A lambda: a block saved in a variable, called later.
discount = ->(price) { price * 0.9 }
puts format("Sale price of the dearest book: %.2f", discount.call(dearest[:price]))
