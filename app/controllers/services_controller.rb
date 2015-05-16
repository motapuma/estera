class ServicesController < ApplicationController
	
	def alltypes

		respond_to do |format|
	      
	    	format.html {  }
	        format.json { render json: Service.services_types_to_json }
	      
	    end

	end

end
