class AddOrgToPage < ActiveRecord::Migration
  def change
    add_column :pages, :org_id, :int, :default => 1
  end
end
