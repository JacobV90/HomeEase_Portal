class ProfileController < ApplicationController
    
  layout "profile"

  before_action :authenticate_user!
  
  def dashboard
     @properties = Property.all
  end
   
  def bank
    puts "bank"
    render "bank"
  end
  
end