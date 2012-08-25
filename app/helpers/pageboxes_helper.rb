require 'net/http'
require 'uri'

module PageboxesHelper
  def get_content_type(item)
    if item.downcase.match('(png|jpg|gif)$')
      return 'image'
    else
      uri_item = URI.parse(item)
      http = Net::HTTP.new(uri_item.host, uri_item.port)
      request = Net::HTTP::Get.new(uri_item.request_uri)

      response = http.request(request)
      return response.content_type
    end
  end
end
