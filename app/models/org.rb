class Org < ActiveRecord::Base
  has_many :pages
  has_many :pageboxes, :through => :pages
  validates_presence_of :title
end
