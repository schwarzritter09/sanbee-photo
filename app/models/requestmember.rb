class Requestmember < ActiveRecord::Base
  belongs_to :article
  belongs_to :member
end
