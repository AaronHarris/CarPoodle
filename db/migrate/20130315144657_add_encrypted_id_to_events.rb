class AddEncryptedIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :encrypted_id, :string
  end
end
