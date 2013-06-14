class Vote < ActiveRecord::Base
  attr_accessible :browser, :location, :option_id, :os, :time, :user_id, :epoll_id, :city, :is_mobile
  belongs_to :option, :counter_cache => true
  belongs_to :user
  validates_uniqueness_of :epoll_id, :scope => :user_id
  validates_presence_of :option_id
end
