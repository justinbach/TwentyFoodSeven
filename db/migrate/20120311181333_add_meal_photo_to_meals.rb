class AddMealPhotoToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :meal_photo, :string

  end
end
