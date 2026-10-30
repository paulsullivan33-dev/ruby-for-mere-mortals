# Collections and Blocks

**Outcome:** you can walk, transform, filter and summarise a
collection without writing a counter loop — and you can
write a method that takes a block of its own.

**Check:** transcript `t02` runs `blocks_demo.rb`; its five
sample books total **77 copies** worth **1127.36**, and both
numbers appear there.

## Arrays and hashes

An **array** is an ordered list: `books[0]` is the first
book, `books.size` the count. A **hash** is labelled pairs:
the lab holds each book as one —

```ruby
{ title: "The Clockwork Orchard", author: "M. Ellery",
  genre: "Fiction", price: 12.99, stock: 14 }
```

`title:` here is symbol-key shorthand, the standard Ruby
spelling; `book[:price]` reads a value back out.

## The block pattern

Nearly every collection method takes a block — `{ |b| ... }`
or the multi-line `do ... end` — and runs it once per
element, handing the element to the part between the bars:

```ruby
books.each { |b| puts "#{b[:title]} -- #{b[:stock]} on the shelf" }
```

- **`each`** — do something with every element; returns the
  collection itself. For side effects: printing, tallying
  on paper.
- **`map`** — transform every element; returns a new array
  of the results. `books.map { |b| b[:title] }` is the list
  of titles.
- **`select`** — keep the elements the block approves:
  `books.select { |b| b[:stock] < 10 }` is the running-low
  list (one book in the sample).
- **`sum`** — with a block, totals whatever the block
  returns. The lab's two totals are both one-liners:
  `books.sum { |b| b[:stock] }` → 77, and
  `books.sum { |b| b[:price] * b[:stock] }` → 1127.36.
- **`group_by`** — sorts the collection into a hash of
  piles: by genre, the sample gives Fiction 2, Science 2,
  Mystery 1.
- **`max_by` / `sort_by`** — pick or order by a computed
  key: the dearest sample book is *A Field Guide to Clouds*
  at 24.50.

None of these modify the original array. Ruby's style is to
build the answer as a new value and let the source be — a
habit that makes programs easier to re-run and to test.

## Writing a method that takes a block

Methods receive blocks too, and `yield` runs the block the
caller handed over:

```ruby
def announce(count)
  puts "Counting the delivery..."
  (1..count).each { |n| yield n }
  puts "Counted."
end

announce(3) { |n| puts "  box #{n} of 3 checked" }
```

The method decides *when* and *how often*; the block decides
*what happens each time*. That separation — skeleton in the
method, flesh in the block — is the design pattern under
half of Ruby's standard library, from file handling to the
test framework in chapter 13.

## Lambdas: blocks with names

A block must be used where it is written. A **lambda** is
the same idea saved in a variable:

```ruby
discount = ->(price) { price * 0.9 }
discount.call(24.50)   # => 22.05
```

Reach for a lambda when the same small calculation is needed
in three places, or when a method should be *given* its
strategy. For everything else, the anonymous block is the
Ruby way — lighter, and read in the place it runs.
