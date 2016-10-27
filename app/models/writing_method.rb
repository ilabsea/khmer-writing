class WritingMethod < ActiveRecord::Base

  has_many :contents
  has_many :lessons, through: :contents
end
