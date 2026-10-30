# Gems and Bundler

**Outcome:** you know what Ruby arrives with, how to install
a gem and use it, what changes when a gem must be compiled,
and how Bundler pins a project's gems so every machine gets
the same ones.

**Check:** transcripts `t06` (the starting set), `t07` (one
gem installed and used), `t12` (one gem compiled) and `t08`
(a Bundler project resolved and run).

## What arrives in the box

A fresh Ruby is not bare. Transcript `t06`'s `gem list`
shows the set: **default gems** (part of Ruby itself —
`csv` and `json` from chapter 11 are here, marked
`default:`), plus a handful installed alongside, such as
`debug`, `rake` and `minitest` — chapter 13's framework was
on the machine before any installing happened. When a
program says `require "csv"`, this is the shelf it is
reaching to.

## Installing a gem — including when it fails

The ordinary shape is one line:

```console
$ gem install colorize
$ ruby paint.rb
```

**colorize** is a small pure-Ruby gem that gives strings
colour methods; the lab's `paint.rb` prints the morning
stock check with levels in green and a warning in red.

The lab's first attempt is kept verbatim in `t07` because
it teaches more than a success would:

```text
ERROR:  Could not find a valid gem 'colorize' (>= 0), here is why:
  Unable to download data from https://rubygems.org/ -
  Net::OpenTimeout (https://rubygems.org/specs.4.8.gz)
```

The diagnosis mattered more than the error: `curl` reached
rubygems.org instantly through the lab network's proxy,
while Ruby's own HTTPS open timed out — a property of that
machine's plumbing, not of Ruby or of rubygems.org. The
workaround is a general-purpose one, worth knowing anywhere
networks are filtered:

1. Fetch the `.gem` file by a route that works.
2. **Verify it**: the rubygems.org API publishes each gem's
   SHA-256; the lab's file matched (`30b5237f…`).
3. Install the local file: `gem install --local
   colorize-1.1.0.gem` → "Successfully installed
   colorize-1.1.0, 1 gem installed".
4. Use it: `paint.rb` ran, and the transcript's `cat -v`
   pass shows the real escape codes — bold heading, green
   stock lines, the red "only 4 left".

Where gems land is governed by `GEM_HOME` (the lab set its
own folder, so nothing touched the system; `t00` shows it).
That one variable is the whole story of "gem installed but
`require` can't find it" in chapter 17.

## Compiled gems

Some gems contain C for speed. Installing one runs the
compiler, and compiling needs Ruby's headers — transcript
`t12` fails without them, verbatim, and succeeds once the
`ruby3.2-dev` package's headers are in place (chapter 3 has
the standing fix: `sudo apt install ruby-dev`). The gem was
**oj**, a fast JSON library:

```text
Building native extensions. This could take a while...
Successfully installed oj-3.17.7
```

and its proof is a round trip — a hash dumped to JSON text
and loaded back with every value intact. Rule of thumb: a
gem that installs in a blink is pure Ruby; one that pauses
to build is native, and native is where toolchains and
headers enter your life.

## Bundler: the project's own shelf

Installing gems machine-wide answers "what do I have?".
A project needs "what do I run with?" — always the same
answer. **Bundler** reads a `Gemfile`:

```ruby
source "https://rubygems.org"

gem "colorize", "~> 1.1"
```

(`~> 1.1` means "1.1 or later, but not 2.0" — close enough
to pinned, loose enough for fixes.) `bundle install`
resolves the list and writes **Gemfile.lock**, the exact
resolution: colorize **1.1.0**, platform, and the Bundler
version itself. `bundle exec ruby paint.rb` then runs with
exactly those gems in reach — no more, even if the machine
holds others.

The lab's Bundler run (t08) hit the same network wall as
`gem` did — its retry message is kept verbatim — and took
Bundler's own offline route: the verified `.gem` placed in
**`vendor/cache`** (what `bundle package` produces on a
connected machine) and `bundle install --local`, which
resolved, installed into `vendor/bundle`, and wrote the
lockfile. Online or off, the artefacts are the same:
a Gemfile you wrote, a lockfile Bundler wrote, and a run
that cannot drift.
