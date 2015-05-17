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

		  @service = Service.new(service_params)

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

	def filter_per_type

		type = params[:type]

		respond_to do |format|
			format.json { render json: Service.json_per_type(type.to_i) }
		end

	end

  def destroy
	@services = Service.find(params[:id])

    @services.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
 	def edit
 		@service = Service.find(params[:id])
 	end

 def update
 	@service = Service.find(params[:id])
    respond_to do |format|
      if @service.update(service_params)
        #binding.pry
        format.html { redirect_to edit_service_path(@service), notice: 'Service was successfully updated.' }
        format.json { render :edit, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end

  end

	private

	def service_params
      params.require(:service).permit(:name,:latitude,:longitude,:phone,:email,:type,urls_attributes: [:url,:service_id])
    end

end
