class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.datetime :alleged_time
      t.integer :user_id

      t.timestamps
    end
  end
end
