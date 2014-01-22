class Pagebox < ActiveRecord::Base
  belongs_to :page
  validates_presence_of :title, :content
end
