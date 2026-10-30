# Your First Session

**Outcome:** you have held a conversation with Ruby in irb,
seen that every line answers with a value, and defined a
method of your own.

**Check:** transcript `t01` is the lab's session verbatim.
Every result quoted in this chapter appears there.

## Starting the conversation

```console
$ irb
```

At the prompt you type Ruby, one expression at a time, and
irb answers with the expression's **value**. Arithmetic
behaves as expected, and assignments answer with the value
assigned:

```text
2 + 3            → 5
price = 12.99    → 12.99
stock = 14       → 14
price * stock    → 181.86
```

That last number is the shelf value of one of the lab's
books, worked out before any file exists. This is irb's real
job in a programmer's day: not a toy, but a scratchpad where
a guess costs one line.

## Values answer questions

Because everything is an object (chapter 1), anything you
type can be asked what it is and what it can do:

```text
"The Clockwork Orchard".upcase    → "THE CLOCKWORK ORCHARD"
"The Clockwork Orchard".split.size → 3
[3, 1, 2].sort                    → [1, 2, 3]
("A".."E").to_a                   → ["A", "B", "C", "D", "E"]
:science.class                    → Symbol
42.class                          → Integer
nil.class                         → NilClass
```

Three spellings here deserve a first reading. `"..."` is a
**string** — text. `:science` is a **symbol** — a name used
as a value, Ruby's favourite for labels and hash keys (they
fill chapters 6 and 7). `("A".."E")` is a **range**, and
`.to_a` turns it into an array — the first of many
*convert-by-asking* moves in Ruby, where objects happily
describe or transform themselves on request.

## A first method

A method definition also has a value (the method's name, as
a symbol), and the one-line **endless** spelling of it is
pure chapter 1 Ruby — say what it does, skip the ceremony:

```text
def shelf_value(price, stock) = price * stock   → :shelf_value
shelf_value(12.99, 14)                          → 181.86
```

And a taste of blocks, the idea chapter 7 is built on:

```text
3.times { print "ha " }   → ha ha ha (and the value 3)
```

`3.times` asks the number 3 to run the block three times —
a loop with no loop keyword in sight. When a construct in
Ruby looks like the language grew a new feature for one
occasion, it is usually an ordinary method like this one,
on an ordinary object.

## Leaving

`exit` (or Ctrl-D) ends the session. Nothing you defined
survives — irb is a conversation, not a notebook. What you
want to keep goes into a `.rb` file, which is where the next
chapters live. From here on, the lab's evidence is scripts:
files in `ruby-lab/`, run with `ruby <file>.rb`, outputs
kept in the numbered transcripts.
