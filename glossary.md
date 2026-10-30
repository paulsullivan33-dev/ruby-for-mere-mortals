# Glossary

The terms, collected in one place. Each is defined where it
first appears, too; this page is for coming back to.

**Block** — a piece of code handed to a method, to run when
and as often as the method chooses: `{ |x| ... }` or
`do ... end`. The most characteristic construct in Ruby.

**Bundler** — the tool that reads a project's `Gemfile`,
resolves exact gem versions, records them in
`Gemfile.lock`, and runs programs with exactly those gems.

**Class** — the template objects are made from: its data
(instance variables) and its methods. `Book` in chapter 9.

**Comparable** — a module that builds `<`, `>`, `==` and
sorting from the one comparison method `<=>` you define.

**Default gem** — a standard-library component packaged as
a gem that arrives with Ruby itself, updatable like any
gem.

**Dynamic typing** — types live in values, not variables; a
variable may name any object, and checks happen when the
program runs.

**Endless method** — the one-line method spelling,
`def name(args) = body`, available since Ruby 3.0.

**Exception** — a packaged failure (class, message,
backtrace) raised with `raise` and caught with `rescue`.

**Gem** — one RubyGems package: a library or application
with a name and a version.

**Gemfile / Gemfile.lock** — the project's gem list as
written by its author, and the exact resolution Bundler
computed and locked.

**GEM_HOME** — the folder gems install into and are loaded
from; the first place to look when a gem "isn't there".

**Global VM Lock (GVL)** — MRI's rule that one thread per
process runs Ruby code at a time; threads still help while
waiting on input and output.

**Hash** — a collection of labelled pairs, usually with
symbol keys: `{ title: "Dune", stock: 4 }`.

**irb** — Interactive Ruby: the prompt where expressions
answer with their values.

**Instance variable** — an object's own data, spelled with
`@`: `@stock`. Invisible outside except through methods.

**Interpolation** — filling holes in a string with values:
`"#{title} costs #{price}"`.

**Keyword argument** — a method argument passed by name,
`copies: 3`, often with a default, so callers name what
they set.

**Lambda** — a block saved in a variable and called later:
`->(x) { x * 2 }`.

**Metaprogramming** — code that writes or shapes code;
`attr_accessor` generating methods is its everyday face.

**Method** — a named operation an object responds to,
called with a dot: `book.sell(2)`.

**Minitest** — the test framework that ships with Ruby:
`assert_equal` and friends, chapter 13.

**Module** — named behaviour that is mixed into classes
with `include`, or used as a namespace; modules are not
instantiated.

**MRI / CRuby** — the standard Ruby interpreter, Matz's
reference implementation.

**Named capture** — a regular-expression group with a
label, `(?<price>...)`, read back as `match[:price]`.

**Object** — in Ruby, everything: every value has a class
and responds to methods. `42.class` is `Integer`;
`nil.class` is `NilClass`.

**Rails** — Ruby on Rails, the large web framework built
on Ruby; chapter 15's big neighbour, not run in this guide.

**Rake** — Ruby's task runner: named jobs in a `Rakefile`.

**Range** — a span of values, `1..10` or `("A".."E")`,
itself an object that can be turned into an array.

**require** — load a library once: the standard library,
a gem, or (as `require_relative`) a file of your own.

**RubyGems** — Ruby's package system, and the `gem`
command that drives it; the collection lives at
rubygems.org.

**Spaceship operator** — `<=>`, answering -1, 0 or 1 for
less, equal or greater; the one method sorting needs.

**Standard library** — the code that ships with Ruby —
CSV, JSON, dates and more — summoned with `require`.

**Symbol** — a name used as a value, `:science`; unique and
unchanging, Ruby's favourite for labels and hash keys.

**yield** — inside a method, run the block the caller
handed over, passing it values between the caller's bars.
