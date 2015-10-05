class Member < ActiveRecord::Base
  belongs_to :unit
  has_many :articles
end
