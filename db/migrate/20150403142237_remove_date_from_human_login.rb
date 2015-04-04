class RemoveDateFromHumanLogin < ActiveRecord::Migration
  def change
    remove_column :human_logins, :date, :string
  end
end
