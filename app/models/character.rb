class Character
		BASE_URL = "https://gateway.marvel.com:443/v1/public/"
		require 'rest-client'

		def initialize(attributes)
			@attributes = attributes
    end

		def self.fetch_character(name, page)
			begin
				@id = CharacterParser.new(character_id(name)).character[0].id 	
				parser = ComicsParser.new(character_comics(@id, page))
				parser.comics
			rescue => exception
				nil
			end
		end

		def id
			@attributes['id']
		end

		def name
			@attributes['name']
		end

		private
 
		def self.character_comics(id, page)
			RestClient.get(BASE_URL + "characters/#{id}/comics?ts=1&apikey=#{Rails.application.credentials.marvel[:public_key]}" + "&hash=#{Rails.application.credentials.marvel[:secret_hash]}" + "&offset=#{page}")
		end

		def self.character_id(name)
			RestClient.get(BASE_URL + "characters?ts=1&apikey=#{Rails.application.credentials.marvel[:public_key]}" + "&hash=#{Rails.application.credentials.marvel[:secret_hash]}" + "&name=#{name}") 
		end
end
