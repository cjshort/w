class AddCounterCacheToHuman < ActiveRecord::Migration
  def change
    add_column :humans, :human_logins_count, :integer, default: 0
  end
end
