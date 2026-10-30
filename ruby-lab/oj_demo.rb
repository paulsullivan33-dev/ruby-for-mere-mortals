# oj_demo.rb -- the compiled gem doing its job.
require "oj"
book = { "title" => "The Salt Road Atlas", "price" => 18.75, "stock" => 9 }
text = Oj.dump(book)
puts "As JSON text: #{text}"
back = Oj.load(text)
puts "Back again:   #{back['title']} -- #{back['price']} x #{back['stock']}"
