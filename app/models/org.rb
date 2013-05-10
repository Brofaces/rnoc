class Org < ActiveRecord::Base
  has_many :pages
  validates_presence_of :title

  attr_accessible :org_id, :title
end
