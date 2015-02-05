class Pilgrim < ActiveRecord::Base

  def self.drop_burdens
    Pilgrim.all.each do |pilgrim|

      pilgrim.update_attributes(burdens: nil)
    end
  end
end
