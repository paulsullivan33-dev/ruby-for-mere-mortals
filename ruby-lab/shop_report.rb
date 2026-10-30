# shop_report.rb -- the standard library at work: CSV in, JSON out.
# Run from the folder holding books.csv.
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

total_copies = rows.sum { |b| b["stock"] }
total_value  = rows.sum { |b| b["price"] * b["stock"] }
by_genre     = rows.group_by { |b| b["genre"] }.transform_values do |shelf|
  { "titles" => shelf.size, "copies" => shelf.sum { |b| b["stock"] } }
end
dearest = rows.max_by { |b| b["price"] }

report = {
  "shop" => "The Dusty Shelf (invented)",
  "titles" => rows.size,
  "total_copies" => total_copies,
  "total_value" => total_value.round(2),
  "dearest" => { "title" => dearest["title"], "price" => dearest["price"] },
  "by_genre" => by_genre,
}

File.write("report.json", JSON.pretty_generate(report))
puts JSON.pretty_generate(report)
