class AddOrderToPages < ActiveRecord::Migration
  def change
    add_column :pages, :order, :integer
    Page.reset_column_information

    Page.all.each do |page|
      page.order = page.id
      page.save
    end
  end
end
