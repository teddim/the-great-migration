class RemoveEgos < ActiveRecord::Migration
  def change
    remove_column :pilgrims, :ego
  end
end
