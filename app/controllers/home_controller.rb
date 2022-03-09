class HomeController < ApplicationController  

    def fetch_comics
        hash = "598431f8e4529a28777acf44731c36d6"
        publicKey = "07e3e205bebd46de31d15ee9a76d85c2"
        COMICS_URL =  "https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey=#{publicKey}&hash=#{hash}"
        
        comics = Excon.get(COMICS_URL)
        comics_hash = JSON.parse(comics)

        comics_array = comics_hash['data']['results']
    end
end