class Wallet < ApplicationRecord

  validates :private_key, :public_key, :address, :password, presence: true
  belongs_to :user

end
