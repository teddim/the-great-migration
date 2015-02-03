Pilgrim.destroy_all
# Location.destroy_all

p "Good morning!"
sleep(2)
p "Today we are going on an adventure..."
sleep(3)
p "a migration of sort."
sleep(2)
p "A journey full of drastic changes and new discoveries."
sleep(2)
p "Today, we are going on a pilgrimage!"
sleep(2)
p "Oh, and look who is joining us..."
sleep(2)

george_bush = Pilgrim.new(name: "George Bush")
p "George Bush has decided to on on pilgrimage! He decided to bring along a lucky charm. What is it?"
trinket = $stdin.gets.chomp
p "Must be a Texas thing! Nothing like a lucky #{trinket}!"
sleep(1)
george_bush.trinket = trinket
george_bush.save

tom_brady = Pilgrim.new(name: "Tom Brady")
p "Tom Brady has decided to on on pilgrimage! He decided to bring along a lucky charm. What is it?"
trinket = $stdin.gets.chomp
p "Yes, #{trinket}, the lucky charm of champions!"
sleep(1)
tom_brady.trinket = trinket
tom_brady.save

oprah_winfrey = Pilgrim.new(name: "Oprah Winfrey")
p "Oprah Winfrey has decided to on on pilgrimage! She decided to bring along a lucky charm. What is it?"
trinket = $stdin.gets.chomp
p "Annnd you get a #{trinket}, and you get a #{trinket}!"
oprah_winfrey.trinket = trinket
oprah_winfrey.save
sleep(1)
p "This should be quite the journey.\n"
p "When you are ready to begin, run `rake the_journey` to get started"
