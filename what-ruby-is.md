# What Ruby Is

**Outcome:** you can say what Ruby is, where it came from, and
what it is for — and you know the two ideas that explain most
of its behaviour before you write a line of it.

**Check:** by the end of the chapter you can name the year and
the person, and explain in one sentence each what "everything
is an object" and "blocks" mean. Chapter 4 shows both working.

## A language designed to feel good

Ruby is a general-purpose programming language created by
Yukihiro Matsumoto — almost always called **Matz** — and
released in Japan in 1995. Most languages of that era were
designed around the machine: how fast it runs, how little
memory it uses. Matz designed Ruby around the programmer
instead. He has said he wanted a language that made
programmers happy and productive, and you can feel that
priority in the details: method names that read as questions
(`empty?`), punctuation kept out of the way, and more than
one natural way to write the same thing.

Ruby is **dynamically typed**: a variable does not declare
what kind of value it holds, and the same variable can hold a
number today and a string tomorrow. It is **interpreted**:
there is no separate compile step — you hand the Ruby program
your file and it runs it, which is why chapter 4's interactive
session can answer you line by line. And it is thoroughly
**object-oriented**, which in Ruby means something stronger
than usual.

## Idea one: everything is an object

In many languages, numbers and text are special low-level
things, and objects are a layer on top. In Ruby there is no
layer underneath. The number `42` is an object. A piece of
text is an object. Even `nil` — Ruby's "nothing here" — is an
object (the only one of its class). Objects respond to
**methods**: named operations you ask for with a dot.

```ruby
42.class        # => Integer
nil.class       # => NilClass
"abc".upcase    # => "ABC"
```

The practical consequence is consistency. Whatever you are
holding, you ask it questions the same way, and you can ask
any value what it is with `.class`. Chapter 5 leans on this
habit hard, because in Ruby it always works.

## Idea two: blocks

A **block** is a piece of code packaged up and handed to a
method, to be run by that method when and as often as it
chooses. Blocks are how Ruby does most of its looping,
sorting, searching and tidying:

```ruby
["tea", "coffee"].each { |drink| puts drink }
```

That line says: for each drink, do this. You will meet blocks
in nearly every Ruby program ever written, including this
guide's lab scripts from chapter 7 onward. They are the
single most characteristic thing about the language.

## What Ruby is used for

Ruby's fame is **Ruby on Rails**, the web framework David
Heinemeier Hansson extracted from his work at Basecamp and
released in 2004. Rails carried Ruby into thousands of
companies and still powers large, serious sites. Rails is a
neighbour this guide characterises in chapter 15; it is not
the language itself, and the language has a life of its own
outside the web:

- **System scripts and glue** — reading files, renaming,
  converting, reporting; the job chapter 11 does with the
  standard library alone.
- **Command-line tools and build plumbing** — Homebrew, the
  macOS package manager, is written in Ruby, as is the
  CocoaPods tool iOS developers know.
- **Sites and publishing** — Jekyll, the static-site
  generator behind GitHub Pages, is Ruby.
- **Testing and automation** — Ruby had a strong testing
  culture early, and chapter 13's Minitest is part of the
  language's own standard library.

## What Ruby is not

Ruby is not the fastest language you can choose, and it does
not pretend to be: it trades raw speed for clarity and
developer time, a bargain chapter 16 examines honestly. It
is not a language that checks your work before running —
errors arrive while the program runs, which is why its
testing culture matters. And it is not only Rails: judging
Ruby by Rails alone is like judging a workshop by one very
large machine in the corner.

Next: chapter 2 names the parts — the interpreter, the
prompt, the library, and the gem machinery — so that when
something misbehaves later, you know which part to blame.
