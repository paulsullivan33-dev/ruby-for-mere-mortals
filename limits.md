# Limits

**Outcome:** you know where Ruby's edges are before you lean
on them: speed, threads, the typing bargain, version drift,
and weight that arrives with its frameworks.

**Check:** each limit below names its evidence — a chapter,
a transcript, or a documented-only label.

## Speed, stated plainly

MRI is an interpreter executing a dynamic language: expect
it to be slower than C, Rust or Go at number-crunching,
often by a large factor, and roughly competitive with
Python at the scripting and web workloads both are used
for. Ruby 3.x has narrowed old gaps (a method JIT exists
and improves release by release), and for the jobs in this
guide — files, reports, tools, websites of ordinary scale —
the honest answer is that Ruby is fast enough that the
programmer is the bottleneck. If your program is a physics
simulation, this is the wrong workshop; the series has
other guides for those languages.

## Threads and the global lock

MRI has a **Global VM Lock (GVL)**: within one process, only
one thread executes Ruby code at a time. Threads still help
when the work is waiting — network, disk, databases — which
is most web work; they do not multiply CPU-bound work the
way they do in Java or Go. The standard answers are more
processes (web servers run Ruby this way) or JRuby (chapter
15). Programmers meeting Ruby from a threaded language
should have this sentence before they design, not after.

## The typing bargain comes due at scale

Dynamic typing plus pervasive metaprogramming is freedom at
ten files and a genuine cost at ten thousand: no compiler
knows what anything is, renaming is an act of faith backed
by tests, and understanding a large codebase leans on
convention and naming discipline. The mitigations are real
— chapter 13's tests, and **RBS** type signatures with the
Steep checker, which this guide names but does not run —
but they are discipline, not machinery. Small and medium
programs, Ruby's home ground, feel none of this.

## Version drift is a fact of life

Ruby evolves yearly, and a few changes bite: the separation
of positional and keyword arguments in Ruby 3.0 broke code
that 2.7 had accepted, and is still the commonest "worked
on my old Ruby" story. Gems pin their own requirements;
old tutorials demonstrate old idioms. The defence is
chapter 12's: a lockfile that records what the project
actually runs with, and a version line (`ruby --version`)
quoted whenever behaviour surprises you.

## Weight arrives by invitation

The interpreter is light; the ecosystems can be heavy. A
framework application may carry a hundred gems, and a
native gem (chapter 12) needs a compiler and headers on
every machine that installs it — the lab's `t12` failure is
that tax being collected. None of this is hidden, but none
of it is free, and a one-file script that needs none of it
is sometimes the right architecture.

## What Ruby is not for

Not for hard real-time systems, not for squeezing a
battery, not for GPU number work, and — despite Rails —
not *only* for the web: this guide's scripts did their
whole jobs without a framework in sight, which is the
language's original shape. The limits are a coastline, not
a criticism; chapter 1's bargain — programmer happiness
first — is printed on the box, and this chapter is the same
label read from the other side.
