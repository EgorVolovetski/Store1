class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_product(product)
    current_item = cart_items.find_by(product_id: product.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = cart_items.build(product: product, quantity: 1)
    end
    current_item.save
  end

  def remove_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    current_item&.destroy
  end
end
