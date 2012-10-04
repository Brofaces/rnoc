class HomeController < ApplicationController
  def index
    @pages = Page.all
    begin
	@first = Page.find(:first, :conditions => {:enabled => true })
    rescue
	@first = Page.first
    end
  end
end
