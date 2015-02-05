class RemoveBurdens < ActiveRecord::Migration
  def change
    remove_column :pilgrims, :burdens
  end
end
