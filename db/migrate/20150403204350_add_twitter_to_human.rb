class AddTwitterToHuman < ActiveRecord::Migration
  def change
    add_column :humans, :location, :string
    add_column :humans, :picture, :string
  end
end
