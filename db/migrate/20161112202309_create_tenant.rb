class CreateTenant < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.belongs_to :property, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
    end
    
  end
  
end
