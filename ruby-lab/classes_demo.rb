# classes_demo.rb -- the Book class from bookshop.rb, inheritance,
# and exceptions caught in the act.
require_relative "bookshop"

# Inheritance: a subclass that adds one idea of its own.
class SignedBook < Book
  attr_reader :signer

  def initialize(title, author, genre, price, stock, signer)
    super(title, author, genre, price, stock)
    @signer = signer
  end

  def to_s
    "#{super} -- signed by #{signer}"
  end
end

shelf = [
  Book.new("The Clockwork Orchard", "M. Ellery", "Fiction", 12.99, 14),
  Book.new("How Bridges Stand", "T. Adeyemi", "Science", 29.99, 4),
  SignedBook.new("Stars for Beginners", "R. Okafor", "Science", 17.25, 18, "the author"),
]

shelf.each { |b| puts b }
puts "Cheapest first: #{shelf.sort.map(&:title).join(' | ')}"

shelf.first.sell(2)
puts "After selling 2: #{shelf.first}"

# Exceptions: the failure is a value you can catch and read.
begin
  shelf[1].sell(99)
rescue RuntimeError => e
  puts "Sale refused, as it should be: #{e.message}"
end

begin
  Book.new("Imaginary", "A. Nonymous", "Fiction", -5, 1)
rescue ArgumentError => e
  puts "Bad book refused: #{e.message}"
end
