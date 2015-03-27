class AddBusinessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :businessname, :string
    add_column :users, :businesscategory, :string
    add_column :users, :fullname, :string
  end
end
