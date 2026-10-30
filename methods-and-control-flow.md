# Methods and Control Flow

**Outcome:** you can define a method with defaults and
keyword arguments, choose between branches, loop on a
condition, and navigate a value that might be nil — knowing
the trap in that last one.

**Check:** transcript `t13` runs `control_demo.rb`; the three
shelf states, the labels, the section lookup and the
countdown all appear there.

## Methods: the last expression is the answer

```ruby
def shelf_state(stock)
  if stock == 0
    "sold out"
  elsif stock < 5
    "running low"
  else
    "plenty"
  end
end
```

There is no `return` because there is nothing to add: an
`if` is an expression, its value is the branch it took, and
a method's value is its last expression. (`return` exists,
for leaving early — guard clauses at a method's top are its
idiomatic home.) The lab's answers: `shelf_state(0)` →
"sold out", `(4)` → "running low", `(18)` → "plenty".

## Arguments: positional, defaulted, keyword

```ruby
def label(title, copies: 1, shout: false)
  text = "#{title} x#{copies}"
  shout ? text.upcase : text
end

label("The Salt Road Atlas")                       # "The Salt Road Atlas x1"
label("The Salt Road Atlas", copies: 3, shout: true) # "THE SALT ROAD ATLAS X3"
```

`copies:` with a value after the colon is a **keyword
argument with a default**: callers may omit it, and when
they supply it they name it — which is why the second call
reads clearly with two options set and no positions to
count. The `? :` in the body is the **ternary**: a one-line
if whose value is one of two things.

## case: choosing by value

```ruby
section = case genre
          when "Fiction" then "the long wall"
          when "Mystery" then "the corner cabinet"
          when "Science" then "the window table"
          else "ask at the desk"
          end
```

Again the whole `case` is an expression whose value lands
in `section`. `when` compares with `===`, which for plain
values means equality — and for ranges and classes means
membership and kind, which is why `case` outgrows `if`
chains so quickly in real Ruby.

## Loops, lightly

Ruby programmers loop with blocks first (chapter 7), but
the plain forms exist and the lab runs a `while`:

```ruby
boxes = 3
while boxes.positive?
  puts "box #{boxes} shelved"
  boxes -= 1
end
```

One-line **modifiers** state a condition after the act it
guards — `puts "reorder" if low`, `puts "no alarm" unless
sold_out` — and read well exactly when the act is the point
and the condition is the footnote. Used on anything longer,
they hide the decision; keep them to one line, as here.

## Safe navigation, and its trap

`&.` calls a method only if the receiver is not nil:

```ruby
next_delivery = nil
next_delivery&.fetch("day", "unknown")   # => nil — not "unknown"!
"Friday"&.upcase                          # => "FRIDAY"
```

Read the lab's output closely (t13): the delivery line
prints **empty**. Safe navigation skips the *whole call*,
default argument and all — `fetch` never runs, so its
fallback never happens, and the result is plain nil. The
operator protects you from a crash; it does not supply your
default. Write the default where it survives:

```ruby
(next_delivery || {})["day"] || "unknown"
```

or check for nil explicitly. This is the single most
misread line in everyday Ruby, and the lab kept the empty
answer in the transcript rather than tidying it away.
