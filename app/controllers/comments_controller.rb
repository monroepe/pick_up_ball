class CommentsController < ApplicationController
before_action :authenticate_user!

  def new
    @game = Game.find(params[:game_id])
    @comment = Comment.new
  end

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to location_game_path(@game.location, @game), notice: "Comment created successfully!"
    else
      render "new"
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to location_game_path(@game.location, @game), notice: "Comment updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to location_game_path(@game.location, @game), notice: "Comment deleted successfully!"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
