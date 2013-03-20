class RemoveEncryptedIdFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :encrypted_id
  end

  def down
    add_column :events, :encrypted_id, :string
  end
end
