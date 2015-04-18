class AddLogoUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :logourl, :string
  end
end
