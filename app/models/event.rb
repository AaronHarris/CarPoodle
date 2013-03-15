class Event < ActiveRecord::Base
  attr_accessible :name, :description, :time, :place, :admin, :email
  validates_presence_of :name
  has_many :drivers 
  has_many :riders
  has_many :waitlists 
end



#
#  create_table "events", :force => true do |t|
#    t.string   "name"
#    t.datetime "created_at",  :null => false
#    t.datetime "updated_at",  :null => false
#    t.string   "description"
#    t.datetime "time"
#    t.string   "place"
#    t.string   "admin"
#    t.string   "email"
#  end
#

