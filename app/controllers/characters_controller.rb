class CharactersController < ApplicationController  

    def search
			@page = params.fetch(:page, 0).to_i 
			@character = params[:character]  if params[:character].present?
			
			if @character.present?
				@comics = Character.fetch_character(@character, @page)
					if @comics
						render 'characters/index'
					else
						flash[:alert] = "Please enter a valid character."
						redirect_to root_path
					end
			else
				flash[:alert] = "Please enter a character name to serch."
				redirect_to root_path
			end
    end
end
