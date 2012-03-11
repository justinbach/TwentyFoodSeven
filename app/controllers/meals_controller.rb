class MealsController < ApplicationController

  before_filter :authenticate_user!, :except => [ :index, :show ] 

  def index
    @meals = params[:user].nil? ? Meal.find(:all) : Meal.where(:user_id => params[:user])
  end

  def show
    @meal = Meal.find(params[:id])
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
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update_attributes(params[:meal])
      flash[:notice] = "Meal successfully updated."
      redirect_to :action => :index
    else
      render :edit
    end
  end

end
