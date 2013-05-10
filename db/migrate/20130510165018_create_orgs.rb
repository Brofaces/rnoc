class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :title
      t.integer :org_id

      t.timestamps
    end
    add_index :orgs, :org_id, :unique => true
  end
end
