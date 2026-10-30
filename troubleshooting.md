# Troubleshooting

**Outcome:** the failures this guide actually met, each with
its cause and its fix — so the first time one of them is
yours, it is already familiar.

**Check:** every message quoted below is verbatim from the
transcripts named beside it.

## `cannot load such file -- colorize` (t07)

```text
cannot load such file -- colorize (LoadError)
```

**Cause:** the program is fine; the gem is not installed —
or is installed somewhere the running Ruby cannot see.
**Fix:** `gem list colorize` to learn whether it exists at
all. If it does but `require` still fails, suspect
`GEM_HOME`/`GEM_PATH`: a gem installed under one gem home
is invisible to a Ruby running with another — the lab ran
with its own `GEM_HOME` throughout, and `gem env home`
(t00) is the command that tells you which home you are in.
Under Bundler, the matching fault is a gem missing from the
Gemfile: install through `bundle add` or the Gemfile, not
`gem install`, so the lockfile stays true.

## The unclosed string (t13)

```text
broken_syntax.rb:2: unterminated string meets end of file (SyntaxError)
```

**Cause:** a quote opened and never closed. Ruby finds it
at parse time — nothing in the file runs — and points a
caret at the line. **Fix:** count quotes on the named line;
remember that an apostrophe inside a double-quoted string
is harmless, but the same mark ends a single-quoted one.
Recent Rubies draw the offending source in the message;
read the picture before the prose.

## `undefined method` — with a suggestion (t13)

```text
undefined method `lentgh' for [1, 2, 3]:Array (NoMethodError)
Did you mean?  length
```

**Cause:** the receiver does not have that method — a typo
(often), the wrong kind of value in the variable (the other
usual suspect), or a library not required. **Fix:** take
the *Did you mean?* seriously first; then ask the value
what it is — `p [1, 2, 3].class` and `.methods` in irb —
because in Ruby the type lives in the value, and the
message already told you the receiver's class (`Array`).

## `gem install` times out on rubygems.org (t07)

```text
Unable to download data from https://rubygems.org/ -
Net::OpenTimeout (https://rubygems.org/specs.4.8.gz)
```

**Cause, as diagnosed in the lab:** the network path, not
Ruby and not rubygems.org — another tool (curl, through the
machine's proxy) reached the same host instantly, while
Ruby's own HTTPS open stalled. Bundler shows the same stall
as a retrying `Bundler::HTTPError` (t08). **Fix:** check
with a second tool before blaming any of the three parties.
Where a proxy or filter is the wall, fetch the `.gem` file
by a route that works, verify its SHA-256 against the
rubygems.org API, and `gem install --local` it; for a
project, place the file in `vendor/cache` and
`bundle install --local`. On an ordinary home network none
of this arises — the plain `gem install` simply works —
but the diagnosis order (host? tool? route?) generalises to
every "the internet is down" that isn't.

## The native gem that will not build (t12)

```text
mkmf.rb can't find header files for ruby at .../ruby.h
```

**Cause:** a gem with C inside it needs Ruby's development
headers, which distributions package apart from the
interpreter. **Fix:** `sudo apt install ruby-dev` (Debian /
Ubuntu) plus a compiler (`build-essential`); the lab's
retry then compiled cleanly. When the build fails *past*
that point, the log gem leaves behind — named at the end of
its error, `gem_make.out` — holds the compiler's own words;
read those, not the summary.

## The test fails and the code looks right (t10)

```text
Expected: 10
  Actual: 12
```

**Cause:** sometimes the test. The failure message names
the test, the line, and both numbers; before changing any
code, recompute the expectation by hand — in the lab's
case, 14 − 2 was 12 all along, and the falsified
expectation was the whole bug. **Fix:** correct the test,
rerun the whole suite (not just the one file's worth of
doubt), and keep the habit of reading *Expected* and
*Actual* in that order: expected is a claim, actual is
evidence.
