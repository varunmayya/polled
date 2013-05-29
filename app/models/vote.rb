class Vote < ActiveRecord::Base
  attr_accessible :browser, :location, :option_id, :os, :time, :user_id
  belongs_to :option
  belongs_to :user
end
