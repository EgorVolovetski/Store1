class User < ApplicationRecord
  rolify
  has_one :profile
  has_many :products
  has_one :cart, dependent: :destroy

  validates :name, :phone, :address, :role, presence: true

  after_create :assign_default_role, :create_cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def assign_default_role
    self.add_role(role.to_sym)
  end

  def manufacturer_email_domain
    domain = email.split('@').last
    errors.add(:email, 'must be from the domain karazin.ua') unless domain == 'karazin.ua'
  end

  def create_cart
    cart || build_cart.save && cart
  end
end