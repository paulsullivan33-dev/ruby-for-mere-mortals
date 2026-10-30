# The Neighbours

**Outcome:** you can place Ruby among the languages beside
it, and among its own household — the frameworks and tools
written in it — knowing which parts of this chapter were run
and which are characterisation.

**Check:** everything in the first half was exercised by the
lab in its own guide or this one. Rails, Sinatra, Jekyll and
the alternative Rubies are **documented-only**: described
from their documentation, never run here, and labelled so
wherever they appear in this guide.

## The languages beside it

**Python** (the series' own
[Python guide](https://paulsullivan33-dev.github.io/python-for-mere-mortals/))
is Ruby's closest counterpart and historical rival: same
era, same dynamic typing, same batteries-included spirit.
The honest differences are temperamental. Python enforces
one obvious way and significant whitespace; Ruby allows
several spellings and prizes how code reads aloud. Python's
scientific and AI ecosystem is far larger; Ruby's web
heritage is deeper. Programmers rarely need both daily, and
choosing is usually choosing an ecosystem, not a syntax.

**Perl** is the ancestor Ruby learned text from: Ruby's
regular expressions, its one-liner heritage and much of its
string toolkit descend from Perl's example, tidied into an
object model. Perl remains the sharper text scalpel at a
shell prompt; Ruby is the easier language to return to after
six months away.

**Node.js / JavaScript** (series'
[Node.js guide](https://paulsullivan33-dev.github.io/nodejs-for-mere-mortals/))
meets Ruby at every web shop: asynchronous by default,
event-driven, with npm's package world beside RubyGems'.
JavaScript's one-language-everywhere reach (browser and
server) is its trump; Ruby's expressiveness per line is
its own.

**Lua** (series'
[Lua guide](https://paulsullivan33-dev.github.io/lua-for-mere-mortals/))
is the opposite philosophy in the same family of dynamic
languages: tiny, embeddable, one data structure. Ruby is
what Lua would be if it wanted to run your whole business
instead of living inside someone else's program.

## Inside Ruby's own house — documented-only

**Rails** is the big neighbour, and honesty about it
matters more than enthusiasm. Ruby on Rails is a full web
framework — routing, database models, views, mail, jobs,
the works — built on *convention over configuration*: name
things the expected way and the framework wires them
together silently. It made Ruby famous, pioneered patterns
the whole industry copied (migrations, RESTful routes,
test-first web development), and still powers large sites
whose names you know. It is also heavy: a new Rails app
arrives with hundreds of files and dozens of gems before
you write a line, and its magic — behaviour summoned by
naming — is exhilarating when you know it and bewildering
when you do not. This guide deliberately teaches the
language first, because every Rails mystery eventually
opens a door marked with chapter headings from this book:
blocks, modules, metaprogramming's polite face. Rails
itself was **not run** in this lab and is characterised
here from its documentation only.

**Sinatra** is the other end of Ruby web: a small library
where a route is a block (`get "/books" do ... end`) and an
app can live in one file. If Rails is a department store,
Sinatra is a market stall — and chapter 7's blocks are
literally its user interface.

**Jekyll** turns Markdown folders into static websites and
powers GitHub Pages; many readers of this series have used
it without ever seeing Ruby. **Homebrew** is written in
Ruby and its package definitions are Ruby files — the
language as build plumbing, invisibly, on millions of Macs.

## The other Rubies

**JRuby** runs Ruby on the Java virtual machine — chosen
for Java integration and true parallel threads. **mruby**
is Matz's small embeddable Ruby, Lua's niche with Ruby's
manners. **TruffleRuby** is a high-performance research
interpreter from the GraalVM project. And **rbenv** and
**rvm** are version managers — several Rubies side by side,
chosen per project — whose pattern the series'
[Mise guide](https://paulsullivan33-dev.github.io/mise-for-mere-mortals/)
teaches as a general skill. The language in these chapters
is the standard interpreter's; programs written to this
guide's level travel between Rubies well.
