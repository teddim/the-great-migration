task :the_journey => :environment do
  class Checker
    def colorize(color_code, string)
      puts "\e[#{color_code}m#{string}\e[0m"
    end

    def red(string)
      red_color_code = 31
      colorize(red_color_code, string)
    end

    def green(string)
      green_color_code = 32
      colorize(green_color_code, string)
    end

    def check(method_to_check, returned_value, expected_value)
      if returned_value == expected_value
        green("#{method_to_check}")
        true
      else
        # red("#{method_to_check}: Expected #{expected_value}, got #{returned_value}\n")
        # false
      end
    end
  end

    location_table_exists = ActiveRecord::Base.connection.table_exists?("locations")
    names_are_different = !Pilgrim.all.map(&:trail_name).any? { |trail_name| ["George Bush", "Oprah Winfrey", "Tom Brady"].include?(trail_name)}

    case true

    when !Pilgrim.first.methods.include?(:burden) && !Pilgrim.first.methods.include?(:trinkets)
      puts "\e[#{32}m#{"almost there"}\e[0m"
      p "Next: I don't trust you to not pick up more burdens after I let you through. Remove that column from the table completely"
      puts "\e[34m#{"Hint: look at the remove_column method in ActiveRecord"}\e[0m"
      puts "\e[35m#{"Pilgrim.first.methods.include?(:burden) == false)"}\e[0m"


    when Pilgrim.where(burden: nil).length == Pilgrim.all.count
      puts "\e[#{32}m#{"burdens emptied"}\e[0m"
      p "Next: I don't trust you to not pick up more burdens after I let you through. Remove that column from the table completely"
      puts "\e[34m#{"Hint: look at the remove_column method in ActiveRecord"}\e[0m"
      puts "\e[35m#{"Pilgrim.first.methods.include?(:burden) == false)"}\e[0m"

    when Pilgrim.all.count == 3
      puts "\e[#{32}m#{"left behind...right"}\e[0m"
      p "The pilgrims reach the entrance of #{Location.last.name} and to the surprise #{Person.first.trail_name}, they are met by a giant talking #{Person.first.burden}."
      p "In order to pass, the #{Person.first.burden} informs the pilgrims that they must follow a series of instructions to move forward"
      p "To start: All pilgrims must leave their burdens at the door. Make the `.drop_burdens` method in the Pilgrim model to set all Pilgrims burdens to nil"
      puts "\e[34m#{"Hint: Try using .each to loop all Pilgrims"}\e[0m"
      puts "\e[35m#{"Pilgrim.where(burden: nil).length == Pilgrim.all.count)"}\e[0m"


    when Pilgrim.first.methods.include?(:burdens)
      puts "\e[#{32}m#{"#{Pilgrim.first.trail_name} and the heavy burdens..."}\e[0m"
      p "Better. A much more serious tone now."
      p "#{Pilgrim.all.map(&:trail_name).to_sentence} all moving slowly towards #{Location.last.name}, their burdens in stow."
      p "#{Pilgrim.last.trail_name} eats a bad potato last night and is moving at a snails pace. The group decides to leave #{Pilgrim.last.trail_name} behind. Delete #{Pilgrim.last.trail_name} from the database}"
      puts "\e[34m#{"Hint: look at the `.destroy` method in ActiveRecord... not morbid at all"}\e[0m"
      puts "\e[35m#{"Pilgrim.all.count == 3)"}\e[0m"


    when Pilgrim.last.trinket.present? && Pilgrim.second.trinket = nil
      p "Nice work"
      p "Now, since I've referenced those attributes as trinkets in one place, and lucky charms in another, let's settle up on a common term. Let's replace that column and call it `burdens`. After all, #{Pilgrim.all.map(&:trinkets).compact.to_sentence} can get pretty heavy."
      puts "\e[34m#{"Hint: create a migration that renames the `trinkets` column to `burdens` on the pilgrims table. look at the `rename_column` method in the ActiveRecord docs"}\e[0m"


    when Checker.new.check("created a new pilgrim", Pilgrim.all.count, 4)
      p "And then there were #{Pilgrim.all.count}."
      p "In the spirit of change, #{Pilgrim.second.trail_name} decides to give #{Pilgrim.last.trail_name} his lucky charm"
      puts "\e[34m#{"Hint: look at the `.update_attributes` method in ActiveRecord. Make sure #{Pilgrim.last.trail_name} gets the trinket, and #{Pilgrim.second.trail_name}'s trinket is nil"}\e[0m"
      puts "\e[35m#{"Pilgrim.last.trinket.present? && Pilgrim.second.trinket = nil"}\e[0m"


    when names_are_different
      p "#{Pilgrim.all.map(&:trail_name).to_sentence}... what a motley crew"
      p "Anyways, #{Pilgrim.third.trail_name} met another Pilgrim in the night, and they've decided to tag along"
      p "Create a new Pilgrim in the database. Be sure to give the new pilgrim a nickname"
      puts "\e[34m#{"Hint: look at the `.create` method in ActiveRecord."}\e[0m"


    when Checker.new.check("changed name to trail name", Pilgrim.first.methods.include?(:trail_name), true)
      p "Super duper great job! Now update each pilgrim with a different `trail_name` than what they currently have"
      puts "\e[34m#{"Hint: look at the `.update_attributes` method in ActiveRecord. Make sure you give everyone a new name"}\e[0m"
      puts "\e[35m#{"Pilgrim.first.methods.include?(:trail_name) == true"}\e[0m"


    when Checker.new.check("created 3 locations", Location.all.count, 3) && location_table_exists
      p "Ah yes there we go. The epic journey that will go to #{Location.all.map(&:name).to_sentence}"
      p "So our journey begins with a long trip over the mountains and our pilgrims decide to rest in #{Location.first.name} for the night."
      p "After a sleepless night of banter and comradery,  George has taken it upon himself to make sure his fellow pilgrims have a 'trail_name'. Write a migration that renames the 'name' column to 'trail_name' for all pilgrims."
      puts "\e[34m#{"Hint: create a migration that renames the `name` column to `trail_name` on the pilgrims table. look at the `rename_column` method in the ActiveRecord docs"}\e[0m"
      puts "\e[35m#{"Location.all.count == 3"}\e[0m"


    when ActiveRecord::Base.connection.table_exists?("locations")
      p "Great, now add 3 locations to the database. Make sure they all have names!"
      puts "\e[34m#{"Hint: create a Location model, and look at ActiveRecord's .create method."}\e[0m"
      puts "\e[35m#{"ActiveRecord::Base.connection.table_exists?('locations')"}\e[0m"


    when Checker.new.check("Annd we're off", Pilgrim.all.count, 3)
      p "Err, looks like maybe we jumped the gun. As George may say, 'If you put the wagon before the horse, you can't lead a horse to water and make it drink'"
      p "Maybe you can George out. Create a `locations` table with a column called `name` that is of the type `string` and then rerun this file."
      puts "\e[34m#{"Hint: create a migration, update the migration file, and run your migration"}\e[0m"
      puts "\e[35m#{"Pilgrim.all.count == 3"}\e[0m"


    else
      p "Looks like you need some Pilgrims! Rerun the seed file"
    end
end
