require 'net/http'
require 'uri'

module PagesHelper
  def display_content(item)
    if item.downcase.match('(png|jpg|gif)$')
      return "<img src='#{item}'></img>"
    else
      uri_item = URI.parse(URI.encode(item))
      http = Net::HTTP.new(uri_item.host, uri_item.port)
      request = Net::HTTP::Get.new(uri_item.request_uri)

      response = http.request(request)
      return "<iframe src='#{item}'></iframe>"
    end
  end
end
