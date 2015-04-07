class AddUserIdToHumanLogin < ActiveRecord::Migration
  def change
    add_column :human_logins, :user_id, :integer
  end
end
