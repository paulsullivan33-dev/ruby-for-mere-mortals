# Ruby for Mere Mortals

Ruby is a programming language designed to
feel pleasant to write. It comes from
Japan, where Yukihiro Matsumoto — "Matz" —
released it in 1995 with a stated goal
most languages never mention: programmer
happiness. The result reads closer to
English than most code does, treats
everything as an object, and trusts the
programmer to know what they are doing.
Ruby became famous in the 2000s as the
language of **Ruby on Rails**, the web
framework that carried a generation of
startups, but the language is older and
broader than the framework: it writes
system scripts, command-line tools,
build plumbing (Homebrew is written in
Ruby), static sites (Jekyll is too), and
plain small programs that read a file,
work something out, and print the answer.

This guide teaches the language itself,
not Rails. It starts with the interactive
prompt, where every line you type answers
with a value; builds up strings, lists
and hashes, and the **blocks** that make
Ruby read the way it does; writes a small
class for an invented bookshop; reads real
data files with the standard library; and
finishes with the machinery around the
language — **RubyGems** for libraries,
**Bundler** for pinning them, and
**Minitest** for proving your own code
does what you think it does.

The lab behind this guide ran the real
thing: **Ruby 3.2.3**, Ubuntu 24.04's own
ruby3.2 packages, run unmodified. Against
it the lab held an interactive session,
ran scripts for blocks, classes, modules
and patterns, and fed an invented
bookshop's stock list (12 titles, 138
copies) through the CSV and JSON parts of
the standard library — then checked the
totals two more ways (awk and Python),
getting the same 138 copies and the same
shelf value, 2182.87, from all three. It
installed a small gem, used it, pinned it
with Bundler, compiled a second gem from
C, and wrote tests that pass — including
one test deliberately made to fail, kept
in the transcripts exactly as it failed,
because reading a failure is a skill the
guide teaches on purpose.

What the lab could not do, it did not
fake. Ruby's own HTTPS calls to
rubygems.org timed out in the lab's
network while other tools got through,
so the gem chapters show the failure
verbatim, the diagnosis, and the honest
workaround (fetch the gem file another
way, check its fingerprint, install it
locally) rather than a tidied-up success.
Rails is characterised from documentation
as the big neighbour it is; it is never
run here, and the text says so wherever
it appears. `criteria.md` keeps the full
ledger of what was run and what was only
read.

## What this guide covers

- [**What Ruby is**](what-ruby-is.md) —
  where Ruby came from, what it is for,
  and the two ideas — everything is an
  object, and blocks — that explain
  almost everything else in it
- [**The moving parts**](the-moving-parts.md) —
  the interpreter, the interactive prompt,
  the standard library, gems, Bundler and
  Rake: which part holds what
- [**Installing Ruby**](installing-ruby.md) —
  the package route that was run here,
  the version check, and the developer
  headers that compiled gems need
- [**Your first session**](your-first-session.md) —
  irb, where every line answers with a
  value: arithmetic, strings, a first
  method of your own
- [**Values and objects**](values-and-objects.md) —
  numbers, strings, symbols, arrays,
  ranges, nil, and the habit of asking
  a value what it is
- [**Strings and regular expressions**](strings-and-regex.md) —
  tidying text, interpolation, and taking
  a catalogue line apart with a pattern
  and named captures
- [**Collections and blocks**](collections-and-blocks.md) —
  arrays and hashes, each and map and
  select, folding a shelf into totals,
  and writing a method that takes a block
- [**Methods and control flow**](methods-and-control-flow.md) —
  defining methods, the last expression
  as the answer, if and case, loops, and
  the safe-navigation trap
- [**Classes and modules**](classes-and-modules.md) —
  a Book class for the shop: attributes,
  sorting by one comparison, a module
  mixed in, and a signed edition
- [**Errors**](errors.md) — raising and
  rescuing exceptions, reading an error
  message properly, and the two refusals
  the lab's class makes on purpose
- [**Files and data**](files-and-data.md) —
  CSV in, JSON out, with nothing but the
  standard library, and the cross-check
  habit that keeps a report honest
- [**Gems and Bundler**](gems-and-bundler.md) —
  RubyGems, the gems Ruby arrives with,
  installing one and using it, compiling
  one from C, and Bundler pinning the set
- [**Testing with Minitest**](testing-with-minitest.md) —
  assertions against the shop's class, a
  failure read word by word, and fixing
  the test when the test is wrong
- [**Recipes**](recipes.md) — a word
  counter, a stock valuation, a coloured
  stock report, and a test-first change
- [**The neighbours**](the-neighbours.md) —
  Python, Perl, Node.js and Lua beside it;
  Rails, Sinatra and Jekyll inside its
  own house; and the other Rubies
- [**Limits**](limits.md) — speed, the
  global lock on threads, dynamic typing's
  bargain, version drift, and what a
  framework's weight means in practice
- [**Troubleshooting**](troubleshooting.md) —
  the gem that cannot be found, the
  unclosed string, the mistyped method and
  its helpful suggestion, and the lab
  network's timeout
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

Ruby on Rails as a working skill — it is
a framework with its own guide's worth of
material, and chapter 15 characterises it
honestly without pretending to teach it.
Building web interfaces, talking to
production databases, and deploying
anything are likewise pointed at, not
taught. Metaprogramming — Ruby code that
writes Ruby code — is named where it
explains a behaviour (the attribute
helpers are its polite face) but a full
treatment belongs to a second guide, not
this one.

## How to use this guide

Read chapter 1 for the model and chapter
2 before installing anything — knowing
which part holds what turns later
confusion into a named problem. Chapters
3 and 4 get you a Ruby and a first
session in one sitting. Chapters 5 to 11
are the language, in the order the lab
met it; chapter 12 and 13 are the
tooling around it. The lab's transcripts
live in `ruby-lab/` (numbered `t00` to
`t13`), alongside the scripts that made
them and the bookshop's `books.csv`, so
every output in this guide can be
reproduced or argued with.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [Python for Mere Mortals](https://paulsullivan33-dev.github.io/python-for-mere-mortals/)
- [Node.js for Mere Mortals](https://paulsullivan33-dev.github.io/nodejs-for-mere-mortals/)
- [Lua for Mere Mortals](https://paulsullivan33-dev.github.io/lua-for-mere-mortals/)
- [Regular Expressions for Mere Mortals](https://paulsullivan33-dev.github.io/regex-for-mere-mortals/)
- [Mise for Mere Mortals](https://paulsullivan33-dev.github.io/mise-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/ruby-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/ruby-for-mere-mortals/blob/main/LICENSE-CODE).
