class HomeController < ApplicationController
  def index
    @records = Sector.all
  end
end
