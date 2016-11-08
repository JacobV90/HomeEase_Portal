class Drop < ActiveRecord::Migration[5.0]
  def change
    drop_table :properties
    
    create_table :properties do |t|
      t.string :address,  :null => false, :default => "666 Fluffy Bunny Way, TooCool4School"
      t.integer :rent_amount, :integer, {default: 1000}
      t.integer :number_bathrooms, :default => 0
      t.integer :number_bedrooms, :integer, {default: 0}
      t.string :amenities, :string, {default: "You can list notable things about your property here, such as if pets are allowed or parking is available"}
      t.string :description, :default => ""
      t.boolean :available_to_rent, :default => true
    end
    
  end
end
