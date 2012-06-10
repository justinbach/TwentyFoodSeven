class MealsController < ApplicationController

  before_filter :authenticate_user!, :except => [ :index, :show ] 

  def index
    @meals = params[:user].nil? ? Meal.scoped.page(params[:page]) : Meal.where(:user_id => params[:user]).page(params[:page])
  end

  def show
    @meal = Meal.find(params[:id])
    MealViewing.create(
      :meal_id => @meal.id,
      :user_id => current_user ? current_user.id : nil
    )
    @comment = Comment.new
  end

  def create 
    @meal = Meal.create(params[:meal])
    @meal.user = current_user
    if @meal.save
      flash[:notice] = "Meal succesfully created."
      redirect_to :action => :index 
    else
      render :new
    end
  end

  def new
    @meal = Meal.new
    @meal.meal_time = Time.now
  end

  def edit
    @meal = current_user.meals.find(params[:id])
  end

  def update
    @meal = current_user.meals.find(params[:id])
    if @meal.update_attributes(params[:meal])
      flash[:notice] = "Meal successfully updated."
      redirect_to :action => :index
    else
      render :edit
    end
  end

  def destroy
    @meal = current_user.meals.find(params[:id])
    if @meal.destroy
      flash[:notice] = "Meal successfully deleted."
      redirect_to :action => :index
    else
      flash[:notice] = "Something went wrong." 
      redirect_to :action => :index
    end
  end


end
