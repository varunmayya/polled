class Votes < ActiveRecord::Base
  attr_accessible :browser, :location, :option_id, :os, :time, :user_id
  belongs_to :option
  has_one :user
end
