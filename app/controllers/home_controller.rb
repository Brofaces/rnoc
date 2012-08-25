class HomeController < ApplicationController
  def index
    @pages = Page.all
  end
end
