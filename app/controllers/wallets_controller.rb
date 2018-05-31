class WalletsController < ApplicationController
  def index
  end

  def new
    @wallet = Wallet.new
  end

  def create

    @wallet = Wallet.new
    @wallet.password = params[:password]
    key = Eth::Key.new
    @wallet.private_key = key.private_hex
    @wallet.public_key = key.public_hex
    @wallet.address = key.address
    @user = User.find(1)

    @wallet.user_id = 1

    if @wallet.save!

     else
      render 404
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
