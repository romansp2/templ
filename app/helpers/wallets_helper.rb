module WalletsHelper

  def generate_key
    key = Eth::Key.new
    key.private_hex
    key.public_hex
    key.address
  end


end
