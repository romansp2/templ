class HomeController < ApplicationController
  def index

    @profile = User.find(1)

  end
end
