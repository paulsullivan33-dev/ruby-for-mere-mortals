# strings_demo.rb -- string handling and regular expressions.

# A shelf label from the shop's notebook, deliberately untidy.
label = "  fic-014 , the clockwork orchard , ELLERY  "
code, title, author = label.split(",").map(&:strip)
puts "Code: #{code.upcase}"
puts "Title: #{title.split.map(&:capitalize).join(' ')}"
puts "Author: #{author.capitalize}"

# Interpolation builds strings from values; nothing is concatenated by hand.
price = 12.99
stock = 14
puts format("Label: %s at %.2f, %d on the shelf", title.split.map(&:capitalize).join(" "), price, stock)

# A catalogue line, taken apart with a pattern and named captures.
line = "BK-2214 | Murder at the Millpond | 12.00 | qty 11"
pattern = /\A(?<code>BK-\d+) \| (?<name>.+) \| (?<price>\d+\.\d{2}) \| qty (?<qty>\d+)\z/
m = line.match(pattern)
puts "Matched: code=#{m[:code]} name=#{m[:name]} price=#{m[:price]} qty=#{m[:qty]}"

# scan finds every match, not just the first.
order_note = "Order BK-2214 x2, BK-1099 x1, and BK-2214 again for the window."
puts "Codes in the note: #{order_note.scan(/BK-\d+/).inspect}"
puts "Quantities found: #{order_note.scan(/x(\d+)/).flatten.inspect}"

# sub changes the first match; gsub changes them all.
puts order_note.sub(/BK-\d+/, "BK-0000")
puts "Redacted: #{order_note.gsub(/BK-\d+/, '[code]')}"

# A pattern that must NOT match, proven both ways.
bad = "BK2214 has no dash"
puts "Dashless code matches the strict pattern: #{bad.match?(/\ABK-\d+\z/)}"
puts "Dashless code matches the loose pattern:  #{bad.match?(/BK-?\d+/)}"

# Counting words in a blurb, with a hash doing the tallying.
blurb = "the orchard the clockwork the orchard keeper"
counts = blurb.split.tally
puts "Word counts: #{counts.inspect}"
puts "Most common word: #{counts.max_by { |_word, n| n }.first}"
