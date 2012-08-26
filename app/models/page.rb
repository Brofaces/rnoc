class Page < ActiveRecord::Base
  has_many :pageboxes
  validates_presence_of :title

  def next
    @next = Page.first(:conditions => ['id > ?', self.id], :order => 'id ASC')
    if @next == nil
        @next = Page.first
    end
    return @next
  end
end
