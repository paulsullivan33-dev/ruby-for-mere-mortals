# Testing with Minitest

**Outcome:** you can write a small test suite that pins down
a class's behaviour, run it, and — the real skill — read a
failure and tell whether the code or the test is wrong.

**Check:** transcripts `t09` (5 runs, all green), `t10` (one
failure, verbatim) and `t11` (fixed, green again).

## Why a language guide has a testing chapter

Chapter 5 named the bargain: Ruby's types live in the
values, so nothing checks your calls before the program
runs. The Ruby answer is not to wish for a compiler — it is
to keep a small suite of **tests**: little programs that
state what the code must do, run in milliseconds, and shout
when it stops doing it. **Minitest** is the framework that
ships with Ruby (it was already in transcript `t06`'s
`gem list`).

## The suite

`ruby-lab/test_bookshop.rb` tests the `Book` class from
chapter 9 — which is why the class lives in its own file,
`bookshop.rb`, loaded with one `require_relative`:

```ruby
require "minitest/autorun"
require_relative "bookshop"

class TestBook < Minitest::Test
  def setup
    @book = Book.new("The Clockwork Orchard", "M. Ellery", "Fiction", 12.99, 14)
  end

  def test_selling_reduces_stock
    @book.sell(2)
    assert_equal 12, @book.stock
  end
  # ...
end
```

The conventions are the whole of it: a class that inherits
from `Minitest::Test`; methods whose names start with
`test_`; `setup` runs before each one, so every test gets a
fresh book; and **assertions** — `assert_equal` (expected
first, actual second), `assert_raises` for the refusals —
state the claims. The suite has five: the price label's
format, selling reducing stock, both `raise`s from chapter
9 firing as designed, and books sorting by price.

```console
$ ruby test_bookshop.rb
.....
5 runs, 5 assertions, 0 failures, 0 errors, 0 skips
```

Five dots, one per test, in about two milliseconds. (Each
test here makes one assertion; the two counts need not
match in general.)

## Reading a failure

Transcript `t10` is the same suite with one number
deliberately falsified — the selling test was edited to
expect **10** after selling 2 of 14:

```text
.F...
  1) Failure:
TestBook#test_selling_reduces_stock [test_bookshop_broken.rb:17]:
Expected: 10
  Actual: 12

5 runs, 5 assertions, 1 failures, 0 errors, 0 skips
```

Read it as a report, because it is one: which test (by
name), where (file and line), what was expected, what
actually happened. And then the judgement the framework
cannot make for you: **12 is right** — 14 − 2 was never
going to be 10. The test was wrong; the code was fine. The
failure's job is to point, not to vote. Novices "fix" code
until a bad test passes and call it done; the dot pattern
(`.F...` — the F sits in the second slot) plus two numbers
is all the information needed to do better.

Two habits complete the chapter. First, a failing test that
you *cannot* explain is information about your
understanding, not just your code — stop and read the class
again. Second, the suite's value compounds: every behaviour
you pin stays pinned, so the next change gets the same five
questions asked of it, for free, forever. Chapter 14's last
recipe shows that rhythm on a real change.
