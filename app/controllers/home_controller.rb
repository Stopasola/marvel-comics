class HomeController < ApplicationController  

    def index 
        @comics = Comic.load_comics
    end
end