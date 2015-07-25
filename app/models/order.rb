class Order < ActiveRecord::Base
  belongs_to :beer, :class_name => "Beer", :foreign_key => "beer_id"
end
