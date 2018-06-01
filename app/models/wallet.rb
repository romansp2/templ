
require 'bcrypt'
require 'eth'


class Wallet < ApplicationRecord

  validates :private_key, :public_key, :address, :password, presence: true
  validates :password, length: { minimum: 8 }
  after_validation :crypt_password
  belongs_to :user
  before_save :generate_keys
  include BCrypt

  def init new_password
    self.password = new_password
    generate_keys
    self.user_id = 1
  end

  def balance
    client = Ethereum::Singleton.instance
  end

  private
  def generate_keys
    key = Eth::Key.new
    self.private_key = key.private_hex
    self.public_key = key.public_hex
    self.address = key.address
  end

  def crypt_password
    self.password = BCrypt::Password.create(self.password)
  end

end
