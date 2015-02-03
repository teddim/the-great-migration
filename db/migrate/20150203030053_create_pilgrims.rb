class CreatePilgrims < ActiveRecord::Migration
  def change
    create_table :pilgrims do |t|
      t.string  :name, null: false
      t.integer :location, null: false, default: 0
      t.boolean :ego, null: false, default: true
      t.string  :trinket

      t.timestamps null: false
    end
  end
end
