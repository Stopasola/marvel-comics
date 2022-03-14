class UpvotesController < ApplicationController  


    def create
      session[:return_to] ||= request.referer

      Upvote.create(comic_id: params[:id], user_id: current_user.id)
      redirect_to session.delete(:return_to)
    end

    def delete
      session[:return_to] ||= request.referer

      upvote = Upvote.find_by(
        comic_id: params[:id],
        user_id: current_user.id
      )
      upvote&.destroy!
      
      redirect_to session.delete(:return_to)
    end
end