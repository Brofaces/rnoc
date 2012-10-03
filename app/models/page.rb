class Page < ActiveRecord::Base
  has_many :pageboxes
  validates_presence_of :title

  def next
    @next = Page.first(:conditions => ['id > ? and enabled = ?', self.id, 1], :order => 'id ASC')
    if @next == nil
        @next = Page.first
    end
    return @next
  end

  def prev
    @prev = Page.first(:conditions => ['id < ? and enabled = ?', self.id, 1], :order => 'id DESC')
    if @prev == nil
        @prev = Page.first
    end
    return @prev
  end
end
