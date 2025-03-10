class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  belongs_to :category
  belongs_to :status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :schedule_delivery
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :fee_status_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :schedule_delivery_id, numericality: { other_than: 1 }
    validates :price
    validates :image
  end
end
