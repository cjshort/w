class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :mode
      t.integer :value
      t.string :subject
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
