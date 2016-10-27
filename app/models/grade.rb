class Grade < ActiveRecord::Base

  has_many :lessons

  accepts_nested_attributes_for :lessons
end
