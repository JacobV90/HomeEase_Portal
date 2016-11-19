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
        #this is where the filter should be for people changing index path
        if(@property.user_id != current_user.id)
            redirect_to "https://www.google.com/logos/2010/pacman10-i.html"
        end
   end

   def create
        @property = current_user.properties.create!(prop_params)
        redirect_to property_path(:id => @property.id)
   end
   
   def upload
    uploaded_io = params[:image]
    puts Dir.pwd
    File.open(Rails.root.join('app', 'assets/images', (params[:id] + '.png') ), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to :back
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