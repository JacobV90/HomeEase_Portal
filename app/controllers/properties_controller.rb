class PropertiesController < ProfileController
  before_action :authenticate_user!
   
   def prop_params
       params.require(:property).permit(:address, :rent_amount, :number_bedrooms, :number_bathrooms, :amenities, :description)
   end

   def new
   end

   def show
      @properties= Property.find(params[:id])
   end

   def create
     @property = Property.create!(prop_params)
     #redirect_to property_path @property
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