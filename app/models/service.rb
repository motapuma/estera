class Service < ActiveRecord::Base
	has_many :urls

	def self.services_types_to_json
		services = []

		SERVICE_NAMES.each_with_index do |name,idx|
			services << {"type"=>idx+1,"name"=>name}
		end

		services << {"type"=>0,"name"=>"all"}

		return services.to_json
	end

end