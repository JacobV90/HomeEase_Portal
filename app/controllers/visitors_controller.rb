class VisitorsController < ApplicationController

    def listings
        render "listings"
    end
    
    def about
        render "about"
    end
    
    def user_state
        respond_to do |format|
            format.json { render json: current_user }  # respond with the created JSON object
        end
    end
    
end
