class AddColumnsToHuman < ActiveRecord::Migration
  def change
    add_column :humans, :provider, :string
    add_column :humans, :uid, :string
  end
end
