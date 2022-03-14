class HomeController < ApplicationController  

    def index
        @page = params.fetch(:page, 0).to_i
        @page = 0  if @page <= 0
        @comics = Comic.fetch_comics(@page)
        @comics
    end
end 