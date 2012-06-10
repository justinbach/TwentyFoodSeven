class Meal < ActiveRecord::Base

  default_scope order('meal_time DESC')

  attr_protected :user_id

  belongs_to :user

  has_many :meal_viewings
  has_many :viewed_users, :through => :meal_viewings, :class_name => :user
  has_many :comments

  validates_presence_of :name, :meal_time, :meal_photo

  mount_uploader :meal_photo, MealPhotoUploader

end
