class Member < ActiveRecord::Base
  belongs_to :unit
  has_many :articles
  
  scope :order_by_unit, -> {order('unit_id')}
  scope :order_by_kana, -> {order('kana')}
  scope :order_by_unit_kana, -> {order_by_unit.order_by_kana}
end
