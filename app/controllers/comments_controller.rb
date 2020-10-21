class CommentsController < ApplicationController 

  def create
    
    @artist = Artist.find(params[:comment][:artist_id])
    
    current_user.comment(params[:comment][:artist_id], comment_params[:content])
    flash[:success] = 'コメントを投稿しました'
    redirect_to @artist
  end

  def destroy 
  end

  private 

  def comment_params
    params.require(:comment).permit(:content)
  end
end
