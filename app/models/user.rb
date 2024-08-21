class User < ApplicationRecord
rolify
has_one :profile
has_many :products
validates :name, :phone, :address, :role, presence: true
  after_create :assign_default_role

  def assign_default_role
    self.add_role(role.to_sym)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable, :confirmable
def manufacturer_email_domain
  domain = email.split('@').last
  errors.add(:email, 'must be from the domain karazin.ua') unless domain == 'karazin.ua'
end
end
