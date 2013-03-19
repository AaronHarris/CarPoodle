class AddWaitlistToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :waitlist, :boolean

    # Rider.reset_column_information
    # Rider.all.each do |r|
    # 	if r.blank? then
    # 		r.update(:waitlist => 1)
    # 	else
    # 		r.update(:waitlist => 0)
    # 	end
    # end
  end
end
