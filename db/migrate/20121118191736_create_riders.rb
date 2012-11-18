class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.string :name
      t.integer :driver_id
      t.integer :waitlist_id

      t.timestamps
    end
  end
end
