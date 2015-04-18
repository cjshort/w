class AddLogoUrlToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :logourl, :string
  end
end
