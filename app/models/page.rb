class Page < ActiveRecord::Base
  has_many :pageboxes
  validates_presence_of :title
end
