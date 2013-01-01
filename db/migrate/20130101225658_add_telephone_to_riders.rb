class AddTelephoneToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :telephone, :string
  end
end
