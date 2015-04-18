class RemoveFullNameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :fullname, :string
  end
end
