class PropertiesController < ProfileController
  #before_action :authenticate_user!
    skip_before_filter :verify_authenticity_token  
   def prop_params
       params.require(:properties).permit(:address, :rent_amount, :number_bedrooms, :number_bathrooms, :amenities, :description)
   end

   def new
       @properties = Property.all
   end

   def show
       @properties = Property.create!(prop_params)
   end

   def create
     @properties = Property.create!(prop_params)
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

end