class Page < ActiveRecord::Base
  has_many :pageboxes
  validates_presence_of :title, :order

  def next
    @next = Page.where('"pages"."order" > :order', {:order => self.order}).where(:enabled => true).sort_by{|page| page[:order]}.first
    if @next == nil
      @next = Page.where(:enabled => true).sort_by{|page| page[:order]}.first
    end
    return @next
  end

  def prev
    @prev = Page.where('"pages"."order" < :order', {:order => self.order}).where(:enabled => true).sort_by{|page| page[:order]}.last
    if @prev == nil
      @prev = Page.where(:enabled => true).sort_by{|page| page[:order]}.last
    end
    return @prev
  end
end
