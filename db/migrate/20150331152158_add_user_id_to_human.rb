class AddUserIdToHuman < ActiveRecord::Migration
  def change
    add_column :humans, :user_id, :integer
  end
end
