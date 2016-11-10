class PropertiesController < ProfileController
  #before_action :authenticate_user!
   skip_before_filter :verify_authenticity_token  
   def prop_params
       params.permit(:street, :city, :state, :zipcode, :price, :bedrooms, :bathrooms, :amenities, :description)
   end

   def new
   end

   def show
        @property = Property.find(params[:id])
   end

   def create
        @property = current_user.properties.create!(prop_params)
        redirect_to property_path(:id => @property.id)
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
    
end