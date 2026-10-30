# bookshop.rb -- the bookshop's one class, kept in a file of its own
# so scripts and tests can both load it.

module Priced
  def price_label
    format("GBP %.2f", price)
  end
end

class Book
  include Priced
  include Comparable

  attr_reader :title, :author, :genre
  attr_accessor :price, :stock

  def initialize(title, author, genre, price, stock)
    raise ArgumentError, "price cannot be negative" if price.negative?

    @title = title
    @author = author
    @genre = genre
    @price = price
    @stock = stock
  end

  def <=>(other)
    price <=> other.price
  end

  def sell(copies = 1)
    raise "not enough stock for #{title}" if copies > stock

    @stock -= copies
  end

  def to_s
    "#{title} by #{author} (#{genre}) -- #{price_label}, #{stock} in stock"
  end
end
