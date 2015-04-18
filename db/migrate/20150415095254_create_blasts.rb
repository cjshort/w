class CreateBlasts < ActiveRecord::Migration
  def change
    create_table :blasts do |t|
      t.string :to
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
