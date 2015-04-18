class AddPersonalsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :region, :string
    add_column :users, :postcode, :string
    add_column :users, :country, :string
    add_column :users, :receivenewsletters, :boolean
  end
end
