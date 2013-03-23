class AddFullToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :full, :boolean, :default => false

    Driver.reset_column_information
    Driver.all.each do |d|
        if (d.spots > d.riders.size)
            d.update(:full => true)
        else 
            d.update(:full => false)
        end
    end
  end
end
