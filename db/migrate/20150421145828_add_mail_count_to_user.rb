class AddMailCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :mailcount, :integer
  end
end
