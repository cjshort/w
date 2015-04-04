class CreateHumanLogins < ActiveRecord::Migration
  def change
    create_table :human_logins do |t|
      t.string :date
      t.string :user_agent
      t.string :ip
      t.integer :human_id

      t.timestamps
    end
  end
end
