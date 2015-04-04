class AddInfoToHuman < ActiveRecord::Migration
  def change
    add_column :humans, :fullname, :string
    add_column :humans, :gender, :string
    add_column :humans, :agerange, :string
  end
end
