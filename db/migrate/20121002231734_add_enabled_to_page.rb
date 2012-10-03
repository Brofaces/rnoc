class AddEnabledToPage < ActiveRecord::Migration
  def change
    add_column :pages, :enabled, :boolean, :default => true

  end
end
