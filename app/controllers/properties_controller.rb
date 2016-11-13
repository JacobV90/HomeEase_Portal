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
   
   def edit
       puts "edit happening"
       @property = Property.find(params[:id])
       #redirect_to edit_property_path
   end
   
   def update
       @property = Property.find(params[:id])
       @property.update(street: params[:street], city: params[:city],state: params[:state],zipcode: params[:zipcode],price: params[:price],bedrooms: params[:bedrooms],bathrooms: params[:bathrooms],amenities: params[:amenities],description: params[:description]) 
        redirect_to property_path(params[:id])
       puts "update happening"
   end
   
   def destroy
         @property = Property.find(params[:id])
         @property.destroy
         puts "Property '#{@property.street}' deleted."
         redirect_to properties_path
   end
    
end