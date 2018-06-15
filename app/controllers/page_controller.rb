class PageController < ApplicationController
  def home
  end

  def list
    @places = Place.page(params[:page]).per(12).all
  end
end
