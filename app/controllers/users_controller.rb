class UsersController < ApplicationController
  helper_method WalletsHelper
  include WalletsHelper

  def show
    init_web3
    @profile = User.find(1)
    @wallets = @profile.wallets
    @wallet = Wallet.new

  end

end
