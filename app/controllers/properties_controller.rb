class PropertiesController < ProfileController
  #before_action :authenticate_user!
    skip_before_filter :verify_authenticity_token  
   def prop_params
       params.require(:properties).permit(:address, :rent_amount, :number_bedrooms, :amenities, :description)
   end

   def new
       @properties = Property.all
   end

   def show
        @property = Property.find(params[:id])
   end

   def create
     @properties = Property.create!(prop_params)
     add_to_firebase
     redirect_to properties_path
   end
   
   def index
       @properties = Property.all
   end
   
    def destroy
     @properties = Property.find(params[:id])
     @properties.destroy
     puts "Property '#{@properties.address}' deleted."
     redirect_to property_path
    end

    def add_to_firebase
        
        FIREBASE.update("",{
            "Properties/#{@properties.id.to_s}" => {   
                :street => @properties.address, 
                :price => @properties.rent_amount,
                :bedrooms => @properties.number_bedrooms,
                :description => @properties.description,
                :amenities => @properties.amenities,
                :owner => {
                    :name => current_user.name.to_s,
                    :email => current_user.email.to_s
                }
            },
            "Owners/#{current_user.id.to_s}/Properties/#{@properties.id.to_s}" => {
                :addres => @properties.address, 
                :price => @properties.rent_amount,
                :bedrooms => @properties.number_bedrooms,
                :description => @properties.description,
                :amenities => @properties.amenities
                } 
        })
        
    end
end