# test_bookshop.rb -- Minitest checks for the Book class.
# Run: ruby test_bookshop.rb
require "minitest/autorun"
require_relative "bookshop"

class TestBook < Minitest::Test
  def setup
    @book = Book.new("The Clockwork Orchard", "M. Ellery", "Fiction", 12.99, 14)
  end

  def test_price_label_uses_two_decimals
    assert_equal "GBP 12.99", @book.price_label
  end

  def test_selling_reduces_stock
    @book.sell(2)
    assert_equal 10, @book.stock
  end

  def test_selling_more_than_stock_raises
    assert_raises(RuntimeError) { @book.sell(99) }
  end

  def test_negative_price_is_refused
    assert_raises(ArgumentError) { Book.new("X", "Y", "Z", -1, 1) }
  end

  def test_books_sort_by_price
    dear = Book.new("How Bridges Stand", "T. Adeyemi", "Science", 29.99, 4)
    assert_equal [@book, dear], [dear, @book].sort
  end
end
