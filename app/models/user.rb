class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_name
  # attr_accessible :title, :body
  
has_many :authentications
has_many :epolls, :dependent => :destroy
has_many :votes
  
  def apply_omniauth(omniauth)
    #self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:user_name => omniauth['info']['nickname'], :provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  

  
end
