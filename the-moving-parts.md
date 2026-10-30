# The Moving Parts

**Outcome:** you can name each part of a Ruby installation and
say what it holds, so an error message later tells you which
part is complaining.

**Check:** given the words *interpreter*, *irb*, *standard
library*, *gem*, *Bundler* and *Rake*, you can say in one
sentence what each is for. Transcript `t00` shows the version
of every one the lab used.

## The interpreter: `ruby`

The program named `ruby` is the interpreter: it reads your
`.rb` file and carries out its instructions. The standard
interpreter — the one almost everyone means by "Ruby" — is
called **MRI** (Matz's Ruby Interpreter) or **CRuby**, after
its implementation language. Other Rubies exist (chapter 15
meets JRuby and mruby), but everything in this guide is MRI.

```console
$ ruby --version
ruby 3.2.3 (2024-01-18 revision 52bb2ac0a6) [x86_64-linux-gnu]
```

That one line carries the language version (3.2.3), the
release date, and the platform. When anything in this guide
behaves differently on your machine, this line is the first
thing to compare.

## The interactive prompt: `irb`

**irb** (Interactive Ruby) is a shell for the language
itself. Type an expression, and irb prints its value; define
a method, and you can call it in the next line. It is the
fastest way to test a guess — most Ruby programmers keep it
within reach constantly, and chapter 4 is built on it.

## The standard library: what arrives in the box

Ruby ships with a large **standard library**: code for CSV
files, JSON, dates, network basics, logging and more, already
installed, needing nothing downloaded. You summon a piece of
it with `require`:

```ruby
require "csv"
require "json"
```

Chapter 11 builds the bookshop's report from exactly those
two. Since Ruby 3.0, much of the library is packaged as
**default gems** — present from the start, updatable like
other gems — which is why transcript `t06`'s `gem list`
shows so many entries on a fresh install.

## RubyGems and `gem`: other people's code

**RubyGems** is Ruby's package system, and a **gem** is one
package: a library, an application, or both, with a name and
a version. The `gem` command installs, lists and removes
them:

```console
$ gem list
$ gem install colorize
```

The public gem collection lives at rubygems.org and held,
at the time of writing, well over 180,000 gems. Chapter 12
installs one for real and shows what can go wrong on the way.

## Bundler: pinning the set

`gem install` fetches *a* version of a gem — whichever is
newest and fits. A real project needs *the same* versions on
every machine, every time. **Bundler** is the tool that
records a project's gem list in a file called a **Gemfile**,
works out versions that fit together, and writes the answer
into **Gemfile.lock**. `bundle exec` then runs a program
with exactly those versions in reach. Chapter 12 resolves
and runs a one-gem project; the lockfile it produces is the
whole point.

## Rake: the build tool

**Rake** is Ruby's task runner — a way to name jobs ("build",
"test", "publish") in a **Rakefile** and run them by name.
It arrived in transcript `t00` (version 13.0.6) because it
travels with most Ruby installs. This guide mentions it here
and in the glossary rather than teaching it: the pattern —
named tasks in a file — is the part to recognise.

## The shape of a Ruby program's world

| Part | Holds | You touch it by |
| --- | --- | --- |
| `ruby` | the language itself | running `.rb` files |
| `irb` | a live conversation with it | typing expressions |
| standard library | batteries, included | `require` |
| `gem` / RubyGems | installable libraries | `gem install` |
| Bundler | which versions, exactly | `Gemfile`, `bundle exec` |
| Rake | named jobs | `rake <task>` |

One more file convention: Ruby source files end in `.rb`,
and a file can be both a program and a library — chapter 13
loads the shop's class from `bookshop.rb` in exactly that
way. Next: installing all of this.
