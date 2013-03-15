class AddAdminKeyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :admin_key, :string
  end
end
