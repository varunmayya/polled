class Option < ActiveRecord::Base
  belongs_to :epoll
  attr_accessible :name, :votes
  validates_presence_of :name
end
