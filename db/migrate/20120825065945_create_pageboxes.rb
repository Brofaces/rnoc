class CreatePageboxes < ActiveRecord::Migration
  def change
    create_table :pageboxes do |t|
      t.string :title
      t.text :content
      t.integer :page_id
      t.timestamps
    end
  end
end
