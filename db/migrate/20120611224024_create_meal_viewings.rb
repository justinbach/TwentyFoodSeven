class CreateMealViewings < ActiveRecord::Migration
  def change
    create_table :meal_viewings do |t|
      t.integer :meal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
