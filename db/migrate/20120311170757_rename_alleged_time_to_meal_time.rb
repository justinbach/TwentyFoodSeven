class RenameAllegedTimeToMealTime < ActiveRecord::Migration
  def up
    rename_column :meals, :alleged_time, :meal_time
  end

  def down
    rename_column :meals, :meal_time, :alleged_time
  end
end
