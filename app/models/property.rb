class Property < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  #belongs_to :user
  
  def self.create_property!(prop_params)
        Property.create!(prop_params)
  end
  
   
end
