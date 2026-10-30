# Classes and Modules

**Outcome:** you can write a class that holds data and
behaviour together, generate its accessors instead of
writing them, sort its objects by one honest comparison,
and share behaviour between classes with a module.

**Check:** transcript `t03` runs the shop's class end to end;
the three books, the sorted order and both refusals appear
there.

## A class for a book

```ruby
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
  # ...
end
```

The pieces, in the order a reader meets them:

- **`initialize`** runs when `Book.new(...)` is called; its
  arguments are `new`'s arguments. `@title` is an **instance
  variable** — the object's own notebook, invisible outside
  except through methods.
- **`attr_reader`** generates the reading methods (`title`,
  `author`, `genre`); **`attr_accessor`** generates reading
  *and* writing (`price`, `price=`) — price and stock may
  change; a book's title may not. Writing those six methods
  by hand is the alternative; every Ruby programmer lets the
  generator do it. (The generator is itself a piece of
  metaprogramming — code writing code — used politely.)
- The `raise` in `initialize` refuses nonsense at the door;
  chapter 10 is about that line's family.

## Behaviour: sell, describe, compare

```ruby
def sell(copies = 1)
  raise "not enough stock for #{title}" if copies > stock
  @stock -= copies
end

def to_s
  "#{title} by #{author} (#{genre}) -- #{price_label}, #{stock} in stock"
end
```

`to_s` is the object's answer to "describe yourself" —
`puts book` calls it, which is why transcript `t03`'s books
print as finished sentences.

Comparison is the elegant one. `Comparable` asks only for
the **spaceship operator**, `<=>`, which answers -1, 0 or 1:

```ruby
def <=>(other)
  price <=> other.price
end
```

Define that one method and `Comparable` builds `<`, `>`,
`==`, `between?` and — because arrays sort through `<=>` —
`shelf.sort` for free. The lab's cheapest-first order
(Clockwork Orchard, Stars for Beginners, How Bridges
Stand) is that single definition at work.

## Modules: behaviour with a name

`Priced`, defined in the same file, is a **module**:

```ruby
module Priced
  def price_label
    format("GBP %.2f", price)
  end
end
```

A module is a bundle of methods that cannot be instantiated
— you cannot make a `Priced` — but any class may `include`
it, and its methods arrive as if written in the class. That
is how `price_label` is available inside `Book#to_s`. The
rule of thumb: a **class** is something you make instances
of; a **module** is something you mix in, or a namespace
that keeps related names together.

## Inheritance, used sparingly

```ruby
class SignedBook < Book
  def initialize(title, author, genre, price, stock, signer)
    super(title, author, genre, price, stock)
    @signer = signer
  end

  def to_s
    "#{super} -- signed by #{signer}"
  end
end
```

`SignedBook` takes everything `Book` has, adds a signer,
and extends `to_s` by calling `super` — the parent version
of the same method — and appending. Ruby has single
inheritance (one parent) and gets its flexibility from
modules instead; deep family trees are considered a smell,
and a two-level example like this one is the honest size of
the tool's everyday use.

The class lives in `ruby-lab/bookshop.rb`, separate from
the demo that exercises it — because chapter 13's tests
need the class without the demo. That split, library here
and program there, is the shape of nearly every real Ruby
project.
