class AddSelectedToUser < ActiveRecord::Migration
  def change
    add_column :users, :loginpage, :string
    add_column :users, :welcomepage, :string
  end
end
