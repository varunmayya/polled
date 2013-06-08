class Epoll < ActiveRecord::Base
  attr_accessible :question, :status, :timeout, :user_id, :options_attributes
  has_many :options, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :options, :allow_destroy => true
  validates_presence_of :question
  validates_associated :options
  validates_presence_of :options
  validates_presence_of :options
  before_validation :require_two_options

    private
      def require_two_options
        errors.add(:base, "You must provide at least two options") if options.size < 2
      end
      
end
