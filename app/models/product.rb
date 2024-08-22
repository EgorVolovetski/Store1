class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  validates :name, :description, :price, :category, :user, presence: true
end