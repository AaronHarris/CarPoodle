class AddDescriptionAndTimeAndPlaceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description, :string
    add_column :events, :time, :datetime
    add_column :events, :place, :string
  end
end
