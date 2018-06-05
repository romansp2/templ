class WalletsController < ApplicationController
  helper_method WalletsHelper
  include WalletsHelper
  def index
  end

  def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new
    @wallet.init params[:password]
    if @wallet.save!
      redirect_to user_wallet_path(params[:user_id],@wallet)
    else

    end


  end

  def show
    init_web3
    @profile = User.find(1)
    @wallet = Wallet.find(params[:id])
    @transactions = get_transactions @wallet.address

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private



end
