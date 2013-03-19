class AddFullToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :full, :boolean, :default => 0

    Driver.reset_column_information
    Driver.all.each do |d|
        if (d.spots > d.riders.size)
            d.update(:full => 1)
        else 
            d.update(:full => 0)
        end
    end
  end
end
