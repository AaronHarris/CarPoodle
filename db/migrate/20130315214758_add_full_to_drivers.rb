class AddFullToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :full, :boolean
  end
end
