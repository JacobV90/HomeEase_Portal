class ProfileController < ApplicationController
  before_action :authenticate_user!

   def new
   end

   def show
   end
       
   def create
     
   end
   
   def index
       #render "dashboard"
   end
   
   def dashboard
       puts "like wtf"
       render "_dashboard"
   end
   
    def bank
        render "bank"
    end
   
end