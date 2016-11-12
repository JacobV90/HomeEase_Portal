class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    
    create_table :properties do |t|
      t.string :street,  :null => false, :default => ""
      t.string :city,  :null => false, :default => ""
      t.string :state,  :null => false, :default => ""
      t.integer :zipcode,  :null => false, :default => ""
      t.integer :price, :null => false, :default => "0"
      t.integer :bathrooms, :default => 0
      t.integer :bedrooms, :default => 0
      t.string :amenities, :default => ""
      t.string :description, :default => ""
      t.boolean :availability, :default => true
      t.integer :user_id
    end
    
    add_index :properties, :user_id
    
  end
end
