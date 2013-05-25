class Epoll < ActiveRecord::Base
  attr_accessible :question, :status, :timeout, :user_id, :options_attributes
  has_many :options
  belongs_to :user
  accepts_nested_attributes_for :options, :reject_if => :all_blank, :allow_destroy => true
  validates_presence_of :question
end
