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

end