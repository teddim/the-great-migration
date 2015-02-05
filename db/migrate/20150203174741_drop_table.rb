class DropTable < ActiveRecord::Migration
  def up
    drop_table :pilgrims
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
