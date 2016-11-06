class PropertiesController < ProfileController
  before_action :authenticate_user!

   def new
   end

   def show
      @properties= Property.find(params[:id])
   end

   def create
     #@property = Property.new(post_params)
     #redirect_to property_path @property
   end
   
   def index
       @properties = Property.all
   end
   


end