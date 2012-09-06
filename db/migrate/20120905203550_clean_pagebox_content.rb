class CleanPageboxContent < ActiveRecord::Migration
  def up
    rename_column :pageboxes, :content, :old_content
    add_column :pageboxes, :content, :string
    Pagebox.reset_column_information

    Pagebox.all.each do |pb|
      m = /(?:'|")(.*)(?:'|")/.match(pb.old_content)
      Pagebox.update(pb.id, :content => m[1]) if m
    end

    remove_column :pageboxes, :old_content
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover old sources (with html included)"
  end
end
