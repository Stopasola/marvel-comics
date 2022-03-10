class Comic
    include ActiveModel::API
    require 'rest-client'

    attr_accessor :id, :title, :onsale_date, :cover_img 
    validates_presence_of :id, :title, :onsale_date, :cover_img

    BASE_URL = "https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey="

    def self.load_comics
        

        comics = RestClient.get(BASE_URL + 
                          "#{Rails.application.credentials.marvel[:public_key]}" + 
                            "&hash=#{Rails.application.credentials.marvel[:secret_hash]}")
        
        comics_hash = JSON.parse(comics)

        comics_array = comics_hash['data']['results']
    end



end

    