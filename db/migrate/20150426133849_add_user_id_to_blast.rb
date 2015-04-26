class AddUserIdToBlast < ActiveRecord::Migration
  def change
    add_column :blasts, :user_id, :integer
  end
end
