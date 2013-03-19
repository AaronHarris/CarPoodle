class DropWaitlistTable < ActiveRecord::Migration
  def up
  	drop_table :waitlists
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
