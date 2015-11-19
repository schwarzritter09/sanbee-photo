class User < ActiveRecord::Base
  devise :omniauthable
    
  has_many :favoritemembers, :dependent => :destroy
  has_many :members, :through => :favoritemembers
  
  accepts_nested_attributes_for :favoritemembers, :allow_destroy => true,
  :reject_if => lambda{ |attrs| attrs[:member_id].blank? }
end
