class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :user_name
  belongs_to :user

  
end
