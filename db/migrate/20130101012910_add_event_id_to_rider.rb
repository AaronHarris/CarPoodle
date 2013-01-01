class AddEventIdToRider < ActiveRecord::Migration
  def change
    add_column :riders, :event_id, :integer
  end
end
