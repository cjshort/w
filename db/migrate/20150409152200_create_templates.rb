class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title
      t.text :description
      t.string :backgroundurl
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
