class AddNotesToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :notes, :text

  end
end
