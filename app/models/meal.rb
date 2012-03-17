class Meal < ActiveRecord::Base

attr_protected :user_id

belongs_to :user

validates_presence_of :name, :meal_time, :meal_photo

mount_uploader :meal_photo, MealPhotoUploader

end
