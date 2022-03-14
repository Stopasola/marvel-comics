class CharacterParser
	def initialize(raw_response)
		@raw_response = raw_response
	end

	def character
		parsed_json['data']['results'].map { |attributes| Character.new(attributes) }
	end

	private

	def parsed_json
		@parsed_json ||= JSON.parse(@raw_response)
	end
end