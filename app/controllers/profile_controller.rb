class ProfileController < ApplicationController
    
  layout "profile"

  before_action :authenticate_user!
  
  def index
  end
  
  def dashboard
  end
   
  def bank
    puts "bank"
    render "bank"
  end
   
end