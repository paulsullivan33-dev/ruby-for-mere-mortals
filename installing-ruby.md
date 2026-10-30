# Installing Ruby

**Outcome:** a working Ruby on your machine, proven by its
own version line — and you know about the one extra package
that compiled gems need later.

**Check:** `ruby --version` prints a version, and
`irb --version` answers too. Transcript `t00` shows the lab's
exact answers.

## The route the lab ran: your system's packages

The lab ran **Ubuntu 24.04's own Ruby packages** —
`ruby3.2` at version **3.2.3** — unmodified. On a Debian or
Ubuntu machine the ordinary route is:

```console
$ sudo apt update
$ sudo apt install ruby
$ ruby --version
ruby 3.2.3 (2024-01-18 revision 52bb2ac0a6) [x86_64-linux-gnu]
```

(The lab itself did not change any system state: it unpacked
those same packages into a private folder and ran the
identical files from there — the same workaround other
guides in this series use on this machine, disclosed in
`criteria.md`. The version output above is from the lab's
tree, byte-for-byte the distribution's Ruby.)

What the package route gives you: the interpreter, `irb`,
`gem`, and a solid set of default gems. What it does not
give you by default is **Bundler's** separate command in
some distributions (Ubuntu splits it out as `ruby-bundler`;
the lab's tree carries Bundler 2.4.19), nor the **compiler
headers** below.

Other systems, stated plainly and not run here: on macOS,
Ruby ships with the system but is old, and most people
install a current one with Homebrew; on Windows, the
RubyInstaller project is the standard route. The series'
[Mise guide](https://paulsullivan33-dev.github.io/mise-for-mere-mortals/)
covers the version-manager pattern — one tool that pins a
language version per project — which Ruby's own **rbenv**
and **rvm** also follow; chapter 15 returns to them.

## The second package: headers for compiled gems

Most gems are pure Ruby and install as text. Some are part
C, for speed, and those must be **compiled** on your machine
at install time. Compiling needs the Ruby **header files**,
which distributions package separately. The lab learned this
the honest way — transcript `t12` keeps the failure:

```text
mkmf.rb can't find header files for ruby at .../ruby.h
You might have to install separate package for the ruby
development environment, ruby-dev or ruby-devel for example.
```

On Debian/Ubuntu the fix is one package:

```console
$ sudo apt install ruby-dev
```

With headers present (and a C compiler, `build-essential`),
the lab's retry compiled the **oj** gem cleanly and the gem
answered for its work. Moral worth keeping: if a gem install
ever fails with a wall of compiler errors, check for the
`-dev` package before blaming the gem.

## Checking the whole bench

Once installed, these five lines prove the bench is complete
— interpreter, prompt, gems, Bundler, task runner:

```console
$ ruby --version     # ruby 3.2.3 in the lab
$ irb --version      # irb 1.6.2 in the lab
$ gem --version      # 3.4.19 in the lab
$ bundle --version   # Bundler version 2.4.19 in the lab
$ rake --version     # rake, version 13.0.6 in the lab
```

Versions will differ on your machine and that is fine: this
guide teaches Ruby 3.x as the lab ran it, and 3.2 is a good
floor. If your only Ruby is a 2.x system copy (common on
older macOS), install a current one before following along —
a handful of spellings in these chapters (the endless method
in chapter 4 is one) are 3.x-only.

Next: the interactive prompt, where the language starts
answering back.
