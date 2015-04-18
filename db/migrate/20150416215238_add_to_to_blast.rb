class AddToToBlast < ActiveRecord::Migration
  def change
    add_column :blasts, :to, :integer
  end
end
