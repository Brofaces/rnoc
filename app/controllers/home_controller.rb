class HomeController < ApplicationController
  def index
    @pages = Page.all
    @first = Page.first
  end
end
