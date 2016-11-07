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
  
  def create
    test_firebase
    render "bank"
  end
   
  def property
     @properties = Property.all
  end
  
  def test_firebase
    response = FIREBASE.push("Owners", { :name => 'Test', :priority => 1 })
    if(response.success?)
      puts "response success"
    end
  end
  
end