class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, :description, :price, :category, :user, presence: true
end