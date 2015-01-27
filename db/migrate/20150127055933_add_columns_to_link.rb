class AddColumnsToLink < ActiveRecord::Migration
  def change
    add_column :links, :description, :text
    add_column :links, :image_url, :string
    add_column :links, :site_name, :string
  end
end
