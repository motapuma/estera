class ServicesController < ApplicationController
	
	def alltypes

		respond_to do |format|
	      
	    	format.html {  }
	        format.json { render json: Service.services_types_to_json }
	      
	    end

	end

	def announce
		@service = Service.new
	end

	def create

		  @service = Service.new(candidate_params)

		  respond_to do |format|
		    if @service.save
		      format.html { redirect_to :back, notice: 'Servicio Generado' }
		      format.json { render :show, status: :created, location: @candidate }
		    else
		      format.html { render :announce }
		      format.json { render json: @candidate.errors, status: :unprocessable_entity }
		    end
		  end
		
	end

	def index
		@services = Service.all
	end

	private

	def candidate_params
      params.require(:service).permit(:name,:latitude,:longitude,:phone,:email,:type,urls_attributes: [:url,:service_id])
    end

end
