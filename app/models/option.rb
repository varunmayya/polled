class Option < ActiveRecord::Base
  belongs_to :epoll
  attr_accessible :name
  validates_presence_of :name
  has_many :votes, :dependent => :destroy
  
end
