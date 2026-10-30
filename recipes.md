# Recipes

**Outcome:** four small jobs done the Ruby way, each built
entirely from parts the earlier chapters ran for real.

**Check:** the word counts are transcript `t04`'s, the
valuation is `t05`'s, the colours are `t07`'s, and the test
rhythm is `t09`–`t11`'s.

## Recipe 1: count the words in any text

Chapter 6's tally, pointed at a file instead of a literal:

```ruby
counts = File.read("blurb.txt").downcase.split.tally
counts.sort_by { |_word, n| -n }.first(5).each do |word, n|
  puts "#{word}: #{n}"
end
```

`split` with no argument cuts on any whitespace; `tally`
counts; sorting by the count (negated for descending) gives
the top five. Against the lab's blurb the counter's raw
material is `{"the"=>3, "orchard"=>2, ...}` — the same table
t04 produced.

## Recipe 2: value a stock file

Chapter 11's report, trimmed to the question a shop
actually asks on a Friday — *what is on the shelves, in
money?*

```ruby
require "csv"
total = CSV.read("books.csv", headers: true).sum do |r|
  r["price"].to_f * r["stock"].to_i
end
puts format("Shelf value: %.2f", total)   # Shelf value: 2182.87
```

One pass, no intermediate arrays worth naming. Keep the
cross-check habit with it: the same file through awk gave
the same 2182.87 in t05, and yours should agree too before
the number goes in an email.

## Recipe 3: a stock report that flags itself

Chapter 12's gem earning its keep — a report a human can
scan, where the lines needing action carry the colour:

```ruby
require "colorize"
require_relative "bookshop"

def line(book)
  state = book.stock < 5 ? "only #{book.stock} left".red : "#{book.stock} in stock".green
  "#{book.title}: #{state}"
end
```

`paint.rb` in `ruby-lab/` is this recipe standing up: bold
heading, green for plenty, red under five. Run it under
Bundler (`bundle exec ruby paint.rb`) in a project with a
Gemfile and the version under you is the lockfile's, not
the machine's mood.

## Recipe 4: change something, with the net up

The working rhythm of chapter 13, applied to a real change:
give `Book` a `restock` method.

1. **Test first.** Add to `test_bookshop.rb`:

   ```ruby
   def test_restocking_adds_stock
     @book.restock(6)
     assert_equal 20, @book.stock
   end
   ```

   Run it: it fails — `NoMethodError`, because `restock`
   does not exist yet. That failure is the specification,
   written in the framework's own words.
2. **Implement.** In `bookshop.rb`:

   ```ruby
   def restock(copies)
     @stock += copies
   end
   ```
3. **Run the whole suite.** Six tests now, and the point is
   the other five: the change added a behaviour without
   bending the existing ones — price labels, refusals and
   sorting all re-proved in the same two milliseconds.

Every step of this rhythm except `restock` itself appears
in transcripts `t09`–`t11`; the method is three lines, and
the recipe is honestly labelled as assembled from verified
parts.
