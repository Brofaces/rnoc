require 'net/http'
require 'uri'

module PagesHelper
  def display_content(item)
    if item.downcase.match('(png|jpg|gif)$')
      return "<img src='#{item}'></img>"
    else
      return "<iframe src='#{item}'></iframe>"
    end
  end
end
