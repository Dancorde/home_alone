class PageController < ApplicationController
  def home
  end

  def list
    @places = Place.page(params[:page]).per(10).all
  end
end
