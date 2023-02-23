items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  yield(items)
end



gather(items) do 
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end