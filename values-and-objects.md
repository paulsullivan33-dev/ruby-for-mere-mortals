# Values and Objects

**Outcome:** you can recognise Ruby's everyday value types on
sight, and you have the one habit that answers most beginner
questions in this language: ask the value.

**Check:** for each value in the chapter you can name its
class — and transcript `t01` shows `.class` answering for
real.

## The everyday types

| Value | Class | What it is |
| --- | --- | --- |
| `42`, `-7`, `1_000_000` | Integer | whole numbers (underscores are for your eyes) |
| `12.99`, `0.5` | Float | numbers with a fractional part |
| `"The Clockwork Orchard"` | String | text |
| `:science` | Symbol | a name used as a value |
| `[1, 2, 3]` | Array | an ordered list |
| `{ "a" => 1 }` | Hash | labelled pairs (chapter 7) |
| `("A".."E")` | Range | a span, start to end |
| `true`, `false` | TrueClass, FalseClass | the two booleans |
| `nil` | NilClass | "nothing here" — an object, not an absence of one |

Two of these repay a slow look.

**Symbols.** A symbol is a name that Ruby keeps exactly one
of: `:science` anywhere in a program is the same object.
That makes symbols the natural keys for hashes and labels —
cheaper than strings, and clearer about intent ("this is a
label, not text to print").

**nil.** In Ruby, `nil` is a real object that answers
methods, not a hole that crashes on contact. `nil.class`
works; `nil.to_s` gives `""`. It still must be handled —
chapter 8 shows the safe-navigation spelling and the trap
inside it — but it is handled as a value, not feared as a
void.

## Variables are labels, not boxes with types

```ruby
price = 12.99
price.class   # Float
price = "twelve ninety-nine"
price.class   # String — allowed; the label moved
```

A variable names whatever object it was last assigned.
Nothing records a "type" for the variable, because the type
lives in the value. This is the dynamic-typing bargain from
chapter 1: freedom now, and the discipline of chapter 13's
tests to keep the freedom honest.

Constants (names starting with a capital) are a social
contract: Ruby warns if you reassign one, but does not stop
you. Class names are constants — `Book` in chapter 9 is one.

## Methods are questions and orders

Calling a method is sending a message; the dot is the
envelope. Ruby's naming conventions say a lot:

- Names ending in `?` answer a yes/no question:
  `stock.zero?`, `name.empty?`, `price.negative?` (chapter 9
  uses that one).
- Names ending in `!` change the thing itself, or do
  something dangerous — treat them as labelled "careful".
- Plain names either ask for a fact (`size`, `upcase`) or
  give an order (`sort`, `push`).

Parentheses are often optional: `puts "hello"` and
`"abc".upcase` omit them where the meaning stays clear.
This guide keeps them where a beginner benefits from seeing
the joins.

## Everything returns a value

Assignments return the value assigned (chapter 4's
`price = 12.99 → 12.99`). Method definitions return the
method's name. An `if` returns the value of the branch it
took — chapter 8 leans on that. Even `puts`, which prints,
returns `nil`: its job is the side effect, not the answer.
Keep this in mind and Ruby's terser spellings stop being
magic: they are expressions all the way down, and an
expression always has a value.

Next: text — the thing Ruby is asked to handle most often
after numbers.
