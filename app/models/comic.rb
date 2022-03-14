class Comic
    include ActiveModel::API
    require 'rest-client'

    BASE_URL = "https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey="

    def initialize(attributes)
			@attributes = attributes
    end

    def self.fetch_comics(page)
			parser = ComicsParser.new(call_api(page))
			parser.comics
    end

		def upvoted
			Upvote.exists?(comic_id: id.to_s)
		end

		def id
			@attributes['id']
		end

		def title
			@attributes['title']
		end

		def onsale_date
			@attributes['onsaleDate']
		end

		def cover_img
			"#{@attributes["thumbnail"]["path"]}" + "/portrait_uncanny." + "#{@attributes["thumbnail"]["extension"]}"
		end

    private

    def self.call_api(page)
        RestClient.get(BASE_URL + 
        					    "#{Rails.application.credentials.marvel[:public_key]}" + 
              				"&hash=#{Rails.application.credentials.marvel[:secret_hash]}" +
											"&offset=#{page}&orderBy=-onsaleDate")
    end
end

    