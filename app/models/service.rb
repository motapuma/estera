class Service < ActiveRecord::Base
	has_many :urls

	def self.services_types_to_json
		services = []
		services << {"type"=>0,"name"=>"all"}
		
		SERVICE_NAMES.each_with_index do |name,idx|
			services << {"type"=>idx+1,"name"=>name}
		end

		

		return services.to_json
	end

	def self.json_per_type(type)

		services = (type == 0) ?  Service.all : Service.where(service_type:type) 

		service_arrs = []

		services.each do |ser|
			service_arrs << ser.to_local_hash
		end

		return service_arrs.to_json

	end

	def to_local_hash
		h = Hash.new

		h[:id]   = self.id
		h[:long] = self.longitude
		h[:lat]  = self.latitude
		h[:type] = self.service_type
		ser_type = self.service_type.nil? ? 0 : self.service_type   
		h[:type_name] =  SERVICE_NAMES[ser_type]
		h[:name]      = self.name
		h[:email]      = self.email
		h[:phone]      = self.phone
		h[:pictures]   = []

		return h

	end

end