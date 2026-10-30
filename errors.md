# Errors

**Outcome:** you can raise an exception on purpose, catch
one on purpose, and read an error message as the structured
report it is.

**Check:** transcript `t03` shows both of the shop's refusals
being caught and read; transcript `t13` shows two uncaught
errors exactly as Ruby prints them.

## Exceptions: failure as a value

When something is wrong beyond local repair, Ruby code
**raises an exception**: it stops, packages the problem —
a class, a message, and the trail of calls that led there —
and looks for a handler. If none is found, the program ends
and Ruby prints the package. Unhandled, the lab's mistyped
method call looks like this (t13, verbatim):

```text
-e:1:in `<main>': undefined method `lentgh' for [1, 2, 3]:Array (NoMethodError)
Did you mean?  length
```

Read it in order: where it stopped, what it was doing, the
receiver and its class, the exception's own class in
brackets at the end — and, a kindness few languages offer, a
*Did you mean?* suggestion, because the machinery keeps a
list of the methods that do exist.

## Raising your own

The shop's class raises in two places, each with a message
written for whoever must act on it:

```ruby
raise ArgumentError, "price cannot be negative" if price.negative?
raise "not enough stock for #{title}" if copies > stock
```

The first names its class (an argument was wrong); the bare
second one raises `RuntimeError`, Ruby's default. Same
mechanism, different precision — match the precision to how
much the catcher needs to know.

## Catching: begin / rescue / end

```ruby
begin
  shelf[1].sell(99)
rescue RuntimeError => e
  puts "Sale refused, as it should be: #{e.message}"
end
```

`sell(99)` asks for 99 copies of a book with 4 in stock;
the exception lands in the `rescue`, `e` is the exception
object, and `e.message` is the sentence the raiser wrote.
The program continues. Note what the rescue names: the
class it is prepared to handle. A bare `rescue` catches the
broad standard family — convenient, and the classic way to
accidentally swallow a bug you needed to see. Rescue
narrowly, and let the rest crash loudly: a crash with a
trail is a report; a swallowed error is a lie the program
tells you later, worse.

## The other shapes an error takes

- **A missing library** is a `LoadError`, and transcript
  `t07` keeps a real one: `cannot load such file -- colorize`
  — the program was fine; the gem was not installed yet.
  Chapter 17 is its home.
- **A syntax error** is found before anything runs: t13's
  unclosed string stops the file at parse time, with the
  caret under the fault.
- **Wrong-type surprises** are the dynamic-typing tax:
  calling `.upcase` on a number raises `NoMethodError` —
  the value, not the variable, carries the type, and the
  message names the receiver so you can ask what it actually
  was. Chapter 13's tests exist to pay this tax in advance,
  cheaply.
