class AddAdminAndEmailToEvents < ActiveRecord::Migration
  def change
    add_column :events, :admin, :string
    add_column :events, :email, :string
  end
end
