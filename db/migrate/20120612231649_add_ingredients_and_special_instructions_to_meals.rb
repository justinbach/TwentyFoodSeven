class AddIngredientsAndSpecialInstructionsToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :ingredients, :text

    add_column :meals, :special_instructions, :text

    add_column :meals, :url, :string

  end
end
