class ProfileController < ApplicationController
    
  layout "profile"

  before_action :authenticate_user!
  
  def tenant_params
       params.permit(:tenants)
  end
  
  def dashboard
     @properties = Property.all
     @current = current_user
  end
   
  def maintenanceIssue
    puts "Maintenance was clicked"
    render "maintenanceIssue"
  end
  
  def bank
    puts "bank"
    render "bank"
  end
  
  def settings
    puts "settings page"
    render "settings"
  end
  
  #response to tenant adding property to their favorites
  def notifications
    
    property = Property.find(params[:prop_id])
    
    params[:applicants].each_pair do |key, value|
      
      if(!property.tenants.exists?(:email => value[:email]))
        property.tenants.create!({first_name: value[:first_name], last_name: value[:last_name], email: value[:email],
        phone_number: value[:phone_number]})
        
        respond_to do |format|
          format.json { render json: property.to_json }  # respond with the created JSON object
        end
        
      end
    
    end
    
    
    
  end
  
end