# Strings and Regular Expressions

**Outcome:** you can tidy messy text, build a string from
values, and take a line apart with a pattern whose pieces
have names.

**Check:** transcript `t04` runs the lab's `strings_demo.rb`
end to end; every line quoted here is in it.

## Tidying real text

The shop's notebook label arrives untidy, as real text does:

```ruby
label = "  fic-014 , the clockwork orchard , ELLERY  "
code, title, author = label.split(",").map(&:strip)
```

`split(",")` cuts at the commas; `.map(&:strip)` applies
`strip` to each piece — the `&:` spelling turns a method
name into the block that calls it, the commonest block
shortening in Ruby. Then:

```ruby
code.upcase                                    # "FIC-014"
title.split.map(&:capitalize).join(" ")        # "The Clockwork Orchard"
author.capitalize                              # "Ellery"
```

## Building strings: interpolation

Inside a double-quoted string, `#{...}` is a hole Ruby fills
with any expression's value:

```ruby
"#{title} at #{price}, #{stock} on the shelf"
```

For fixed layouts, `format` (also called `sprintf`) takes a
template with named slots for numbers:

```ruby
format("Label: %s at %.2f, %d on the shelf", title, 12.99, 14)
# => "Label: The Clockwork Orchard at 12.99, 14 on the shelf"
```

`%.2f` is why the bookshop's prices always print with two
decimals in this guide — money should never come out as
`12.9` in a report because a Float felt terse.

## Regular expressions: patterns with names

A **regular expression** (the series' Regular Expressions
guide teaches the pattern language itself; this chapter is
about using it from Ruby) sits between slashes. The lab
takes apart a catalogue line:

```ruby
line = "BK-2214 | Murder at the Millpond | 12.00 | qty 11"
pattern = /\A(?<code>BK-\d+) \| (?<name>.+) \| (?<price>\d+\.\d{2}) \| qty (?<qty>\d+)\z/
m = line.match(pattern)
m[:code]   # "BK-2214"
m[:name]   # "Murder at the Millpond"
m[:price]  # "12.00"
m[:qty]    # "11"
```

`(?<name>...)` is a **named capture**: the matched piece,
kept under a label you chose. `\A` and `\z` pin the match to
the whole line, so a nearly-right line cannot sneak through
by matching in the middle. `m[:price]` is still a string —
turn it into a number (`to_f`) when you mean to calculate.

## Finding all of them, changing some of them

- `scan` returns every match, not just the first:
  `"Order BK-2214 x2, BK-1099 x1".scan(/BK-\d+/)` gives
  `["BK-2214", "BK-1099"]` — and with a capture group,
  `scan(/x(\d+)/)` gives the quantities.
- `sub` replaces the **first** match; `gsub` replaces
  **all** of them. The lab redacts an order note with
  `gsub(/BK-\d+/, "[code]")`.
- `match?` answers true or false without keeping the pieces
  — the right tool for a gate. The lab proves a dashless
  code fails the strict pattern `/\ABK-\d+\z/` and passes a
  looser one, which is the whole craft: a pattern is a
  decision about what you will accept.

## Counting words

`tally` — one method, no ceremony — counts occurrences in a
list, and the lab's blurb becomes a frequency table:

```ruby
"the orchard the clockwork the orchard keeper".split.tally
# => {"the"=>3, "orchard"=>2, "clockwork"=>1, "keeper"=>1}
```

It is a block-free taste of chapter 7: collections that know
how to summarise themselves.
