class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @profile = User.find(1)
    @wallets = @profile.wallets
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
