# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's bookshop, its stock and its people are invented.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 16 names what the tool
   cannot do: interpreted speed, the Global VM Lock on threads,
   dynamic typing's cost at scale, version drift such as the
   Ruby 3.0 keyword-argument split, and the weight a framework
   brings with it.
8. **The ethics rule is in the text, early.** Ruby raises no
   interception question of the kind other guides in this
   series carry; its own line is about honesty of evidence,
   and chapter 1 draws it plainly — what the lab ran is
   claimed, what it only read is labelled, and the one network
   failure in the lab is printed verbatim rather than tidied
   into a success.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is a 2-CPU, ~8 GB Ubuntu 24.04 sandbox,
shared with other work while the lab ran. Ruby was **not**
installed system-wide: the lab downloaded Ubuntu noble's own
packages with apt in download-only mode into a private folder
and **extracted them unmodified** (`dpkg -x`) — ruby3.2
**3.2.3**-1ubuntu0.24.04.8 with libruby3.2, irb, rake
13.0.6, ruby-minitest 5.22.2, ruby-bundler (Bundler 2.4.19)
and rubygems-integration (RubyGems 3.4.19) — and ran the
identical files from the extracted tree via a wrapper that
sets the library paths and a lab `GEM_HOME`. Two programs in
the tree (`irb`, `bundle`) carry an absolute `#!/usr/bin/ruby`
shebang and were invoked through the interpreter for that
reason alone; on a normal install both run directly.
Commands in the transcripts are shown as a reader types
them. All lab scripts and fixtures are in `ruby-lab/`
(transcripts `t00`–`t13`).

Run for real, with transcripts as evidence:

- Versions of the whole bench (t00): ruby 3.2.3, RubyGems
  3.4.19, Bundler 2.4.19, irb 1.6.2, rake 13.0.6, gcc 13.3.0,
  and the lab's `GEM_HOME`.
- An irb session (t01): arithmetic, assignment values,
  string and array methods, ranges, `.class` on a symbol,
  an integer and nil, an endless method definition, and a
  block passed to `3.times`.
- Blocks and enumerables (t02): `each`, `map`, `select`,
  `sum`, `group_by`, `max_by` over a five-book sample —
  77 copies, shelf value 1127.36 — plus a method using
  `yield` and a lambda.
- Classes and modules (t03): `Book` with generated
  accessors, a `Priced` module mixed in, `Comparable`
  sorting by one `<=>`, a `SignedBook` subclass using
  `super`, and both deliberate `raise`s caught and read.
- Strings and patterns (t04): split/strip/capitalise
  tidying, interpolation and `format`, a named-capture
  regex taking a catalogue line apart, `scan`, `sub` vs
  `gsub`, `match?` passing and failing, and `tally`.
- Standard library (t05): CSV read with border conversion,
  JSON report written and printed — 12 titles, **138
  copies, 2182.87** total value — and the two totals
  recomputed independently with awk and with Python, both
  agreeing exactly.
- RubyGems (t06, t07): the full starting `gem list`; then
  the install of **colorize 1.1.0**. The direct
  `gem install` **failed in this sandbox** — verbatim
  `Net::OpenTimeout` on rubygems.org while curl through the
  sandbox proxy reached the same host at once. The gem file
  was therefore fetched with curl, its SHA-256 checked
  against the checksum the rubygems.org API publishes for
  1.1.0 (`30b5237f…`, matching), installed with
  `gem install --local`, and used: `paint.rb` produced real
  ANSI colour output (bold/green/red escape codes shown via
  `cat -v`).
- Bundler (t08): a one-gem `Gemfile` (`colorize ~> 1.1`).
  The online `bundle install` stalled on the same metadata
  timeout (Bundler's retry message kept verbatim); the
  offline route — the verified `.gem` in `vendor/cache`,
  `bundle install --local` — resolved it, installed into
  `vendor/bundle`, wrote a `Gemfile.lock` naming colorize
  1.1.0, and `bundle exec ruby paint.rb` ran.
- A native-extension gem (t12): **oj 3.17.7** first failed
  verbatim on missing header files; with the ruby3.2-dev
  package's headers extracted and linked where `mkmf`
  looks, the retry compiled ("Building native extensions…
  Successfully installed oj-3.17.7") and a dump/load round
  trip returned every value intact.
- Minitest (t09–t11): five tests over the lab's `Book`
  class, all green (5 runs, 5 assertions); one assertion
  then deliberately falsified (expected 10 after selling 2
  of 14) and its failure kept verbatim — "Expected: 10 /
  Actual: 12", exit 1 — then the expectation corrected and
  the suite green again.
- Control flow and honest errors (t13): if/elsif/else as a
  value, keyword arguments with defaults, `case`, a `while`
  countdown, modifier if/unless, and safe navigation —
  including its trap, kept as run: `nil&.fetch("day",
  "unknown")` returned nil, not the default, because the
  whole call is skipped. Plus a verbatim `SyntaxError`
  (unterminated string) and a verbatim `NoMethodError` with
  its "Did you mean? length" suggestion.

Documented only — described from the projects' documentation,
not run, and the text does not claim otherwise:

- **Ruby on Rails** — characterised in chapter 15 as the big
  neighbour (convention over configuration, its weight and
  its magic) from its documentation; never installed or run.
  The same applies to Sinatra, Jekyll and Homebrew's internals,
  named there as Ruby software, not exercised.
- The other interpreters (JRuby, mruby, TruffleRuby) and the
  version managers rbenv/rvm — characterised; the Mise guide
  in this series covers the version-manager pattern live.
- Install routes beyond Ubuntu's packages: macOS system
  Ruby's age, Homebrew installs, RubyInstaller on Windows.
- RBS/Steep type checking, Rake beyond recognition, and
  metaprogramming beyond the `attr_*` generators — named in
  chapters 15–16, not taught or run.
- The `restock` recipe in chapter 14 is assembled from
  verified parts (the class, the suite, the failure shapes
  of t09–t11); the three-line method itself was not run as
  a separate transcript and the recipe says so.
- A plain online `gem install` / `bundle install` on an
  unfiltered network: in this sandbox Ruby's HTTPS to
  rubygems.org timed out by the clock (t07 ran five minutes
  to its failure), so the online success path itself is
  documented-only here; the failure, the diagnosis, the
  checksum-verified local install and the offline Bundler
  resolution are all run and kept.

Fixtures are this guide's own and deliberately generic: an
invented bookshop ("The Dusty Shelf"), twelve invented
books by invented authors, and stock sentences about the
shop itself — no real people, organisations or events.
