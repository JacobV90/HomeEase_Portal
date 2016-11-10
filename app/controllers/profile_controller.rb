class ProfileController < ApplicationController
    
  layout "profile"

  before_action :authenticate_user!
  
  def dashboard
     @properties = Property.all
     @current = current_user
  end
   
  def bank
    puts "bank"
    render "bank"
  end
  
end