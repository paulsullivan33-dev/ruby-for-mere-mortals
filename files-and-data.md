# Files and Data

**Outcome:** you can read a CSV file, work out the answers,
and write a JSON report — using nothing but the standard
library — and you know how the lab proved its numbers.

**Check:** transcript `t05` shows the report Ruby produced,
and awk and Python arriving at the same totals: **138
copies, 2182.87**.

## The fixture

The bookshop's stock list is `ruby-lab/books.csv`: 12
invented titles with author, genre, price and stock
columns. Everything in this chapter runs against it, and
the file ships with the guide so the numbers below can be
argued with.

## Reading CSV

```ruby
require "csv"
require "json"

rows = CSV.read("books.csv", headers: true).map do |r|
  {
    "title" => r["title"],
    "author" => r["author"],
    "genre" => r["genre"],
    "price" => r["price"].to_f,
    "stock" => r["stock"].to_i,
  }
end
```

`headers: true` makes each row addressable by column name.
The conversion calls are the chapter's quiet lesson: **CSV
only knows strings.** `"12.99"` must become a Float
(`to_f`) and `"14"` an Integer (`to_i`) before arithmetic —
forget once and Ruby will either refuse or, worse,
concatenate. The lab converts at the border, in the one
place every row passes through, so the rest of the program
only ever sees numbers.

## Working out the answers

Everything after the border is chapter 7's machinery:

```ruby
total_copies = rows.sum { |b| b["stock"] }              # 138
total_value  = rows.sum { |b| b["price"] * b["stock"] } # 2182.87
by_genre     = rows.group_by { |b| b["genre"] }         # 5 piles
dearest      = rows.max_by { |b| b["price"] }           # How Bridges Stand, 29.99
```

`transform_values` then summarises each genre pile into
`{titles, copies}` — Fiction leads on copies (46), Science
on price.

## Writing JSON

```ruby
File.write("report.json", JSON.pretty_generate(report))
```

`JSON.pretty_generate` lays the data out for human eyes;
`JSON.generate` writes the same data compactly for machines.
The report holds the shop's name, 12 titles, 138 copies,
2182.87 in value, the dearest book, and the per-genre table
— transcript `t05` shows it in full.

## The cross-check habit

The guide's rule, borrowed from every trade that measures:
never trust the only instrument. The lab recomputed the two
headline numbers with awk over the raw CSV, and again with
Python's csv module. Three implementations, one answer each
time: **copies=138, value=2182.87**. A disagreement would
not have meant Ruby was wrong — it would have meant
*something* was wrong, which is the only thing you need to
know before a report leaves the building. When you write a
report program in any language, keep one awkward number in
it that you can verify by hand or by another tool; this
chapter's are 138 and 2182.87.

## Files generally

Reading a whole file is `File.read("name")`; writing is
`File.write("name", text)`. For large files, `File.foreach`
hands you one line at a time — a block again, the file's
lines treated as a collection (chapter 7's pattern wearing
a different hat). Paths, directories and existence checks
live in `File` and `Dir`; the standard library also carries
`date`, `time`, `logger` and `uri` on the same `require`
terms — the box Ruby arrives in is bigger than this chapter
needed.
