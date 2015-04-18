class RemoveBodyFromBlast < ActiveRecord::Migration
  def change
    remove_column :blasts, :body, :string
    remove_column :blasts, :to, :string
    add_column :blasts, :body, :text
  end
end
