class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(params[:comment])
    @comment.meal_id = params[:meal_id]
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment succesfully added."
      redirect_to meal_path(@comment.meal.id) 
    else
      redirect_to meal_path(params[:meal])
    end
  end
  
end
