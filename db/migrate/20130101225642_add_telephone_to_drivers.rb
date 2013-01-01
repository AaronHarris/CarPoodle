class AddTelephoneToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :telephone, :string
  end
end
