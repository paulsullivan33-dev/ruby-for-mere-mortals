# control_demo.rb -- methods and control flow at the bookshop.

# A method: the last expression is the return value; no return needed.
def shelf_state(stock)
  if stock == 0
    "sold out"
  elsif stock < 5
    "running low"
  else
    "plenty"
  end
end

# Default arguments and a keyword argument.
def label(title, copies: 1, shout: false)
  text = "#{title} x#{copies}"
  shout ? text.upcase : text
end

puts shelf_state(0)
puts shelf_state(4)
puts shelf_state(18)
puts label("The Salt Road Atlas")
puts label("The Salt Road Atlas", copies: 3, shout: true)

# case/when reads like the shelf it describes.
genre = "Mystery"
section = case genre
          when "Fiction" then "the long wall"
          when "Mystery" then "the corner cabinet"
          when "Science" then "the window table"
          else "ask at the desk"
          end
puts "#{genre} lives in #{section}"

# A while loop, and the modifier form for one-liners.
boxes = 3
while boxes.positive?
  puts "box #{boxes} shelved"
  boxes -= 1
end
puts "reorder more bookmarks" if shelf_state(2) == "running low"
puts "no alarm" unless shelf_state(9) == "sold out"

# Safe navigation: &. asks politely when the value might be nil.
next_delivery = nil
puts "Delivery due: #{next_delivery&.fetch('day', 'unknown')}"
puts "Delivery due: #{'Friday'&.upcase}"
