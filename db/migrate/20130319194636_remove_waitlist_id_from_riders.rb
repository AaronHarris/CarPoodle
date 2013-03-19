class RemoveWaitlistIdFromRiders < ActiveRecord::Migration
  def up
    remove_column :riders, :waitlist_id
  end

  def down
    add_column :riders, :waitlist_id, :integer
  end
end
