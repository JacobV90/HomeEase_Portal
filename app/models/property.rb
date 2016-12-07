class Property < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  belongs_to :user
  has_many :tenants, dependent: :destroy

  after_create :send_to_firebase
  before_destroy :delete_from_firebase
  
  def self.create_property!(prop_params)
        Property.create!(prop_params)
  end
  
  def send_to_firebase
    
       FIREBASE.update("",{
            "Properties/#{self.id.to_s}" => {   
                :street => self.street, 
                :city => self.city,
                :state => self.state,
                :zipcode => self.zipcode,
                :lat => "",
                :long => "",
                :price => self.price,
                :bedrooms => self.bedrooms,
                :bathrooms => self.bathrooms,
                :description => self.description,
                :amenities => self.amenities,
                :tenants => "",
                :owner => {
                    :owner_id => self.user.id,
                    :first_name => self.user.first_name,
                    :last_name => self.user.last_name,
                    :email => self.user.email
                },
                :prop_id => self.id
            },
            "Owners/#{self.user.id.to_s}/properties/#{self.id.to_s}" => {
                :owner_id => self.id,
                :street => self.street, 
                :city => self.city,
                :state => self.state,
                :zipcode => self.zipcode,
                :price => self.price,
                :bedrooms => self.bedrooms,
                :bathrooms => self.bathrooms,
                :description => self.description,
                :amenities => self.amenities,
                } 
        })
     
  end
  
  def delete_from_firebase
      prop_id = self.id.to_s
      user_id = self.user.id.to_s
    
      FIREBASE.delete("Properties/#{prop_id}")
      FIREBASE.delete("Owners/#{user_id}/Properties/#{prop_id}")
  end

end
