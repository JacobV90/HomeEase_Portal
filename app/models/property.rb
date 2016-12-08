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
    
       response = FIREBASE.push("Properties/",{
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
                    :owner_id => self.user.owner_id,
                    :first_name => self.user.first_name,
                    :last_name => self.user.last_name,
                    :email => self.user.email
                },
                :prop_id => self.id
            });
       
        data = JSON.parse(response.body.to_json)
        puts response.success?
        response = FIREBASE.update("Owners/#{self.user.owner_id.to_s}/properties/",{
            "#{data['name']}"=>{
                :owner_id => self.user.owner_id,
                :street => self.street, 
                :city => self.city,
                :state => self.state,
                :zipcode => self.zipcode,
                :price => self.price,
                :bedrooms => self.bedrooms,
                :bathrooms => self.bathrooms,
                :description => self.description,
                :amenities => self.amenities,
                :prop_id => self.id
        }
        });
        puts response.success?
     
  end
  
  def delete_from_firebase
      prop_id = self.id.to_s
      user_id = self.user.id.to_s
    
      FIREBASE.delete("Properties/#{prop_id}")
      FIREBASE.delete("Owners/#{user_id}/Properties/#{prop_id}")
  end

end
