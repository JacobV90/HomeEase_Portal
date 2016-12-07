class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :business_name, :string
    add_column :users, :business_address, :string
    add_column :users, :business_phone_number, :string
    add_column :users, :business_email, :string
  end
end
