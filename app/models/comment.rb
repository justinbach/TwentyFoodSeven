class Comment < ActiveRecord::Base
  belongs_to :meal
  belongs_to :user
  validates_presence_of :body
end
