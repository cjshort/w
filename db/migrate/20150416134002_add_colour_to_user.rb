class AddColourToUser < ActiveRecord::Migration
  def change
    add_column :users, :bghex, :string
  end
end
