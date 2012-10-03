class Page < ActiveRecord::Base
  has_many :pageboxes
  validates_presence_of :title

  def next
    @next = Page.where('id > :id', {:id => self.id}).where(:enabled => true).first
    if @next == nil
        @next = Page.where(:enabled => true).first
    end
    return @next
  end

  def prev
    @prev = Page.where('id < :id', {:id => self.id}).where(:enabled => true).last
    if @prev == nil
        @prev = Page.where(:enabled => true).last
    end
    return @prev
  end
end
