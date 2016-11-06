class ProfileController < ApplicationController
    
  layout "profile"

  before_action :authenticate_user!
  
  def index
     @properties = Property.all
  end
  
  def dashboard
     @properties = Property.all
  end
   
  def bank
    puts "bank"
    render "bank"
  end
   
  def property
     @properties = Property.all
  end
end