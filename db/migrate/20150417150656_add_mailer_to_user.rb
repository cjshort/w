class AddMailerToUser < ActiveRecord::Migration
  def change
    add_column :users, :mailer, :string
  end
end
