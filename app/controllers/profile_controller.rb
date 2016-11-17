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
    email = params[:tenants][:email]
    first = params[:tenants][:first_name]
    last = params[:tenants][:last_name]
    
    if !email.equal?("")
      property.tenants.create!({first_name: first, last_name: last, email: email})
    end
    
  end
  
  
end