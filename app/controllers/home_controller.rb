class HomeController < ApplicationController
  def index
    @pages = Page.all.sort_by{|page| page[:order]}
    begin
      @first = Page.all(:conditions => {:enabled => true }).sort_by{|page| page[:order]}.first
    rescue
      @first = Page.sort_by{|page| page[:order]}.first
    end
  end
end
