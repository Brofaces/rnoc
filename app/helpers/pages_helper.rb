require 'net/http'
require 'uri'

module PagesHelper
  def display_content(item, bodies)
    if item.downcase.match('(png|jpg|gif)$')
      return "<img src='#{item}'></img>"
    elsif item.match(/^https:\/\/twitter.com\/.*/)
      return bodies[item]
    else
      return "<iframe src='#{item}'></iframe>"
    end
  end
end
