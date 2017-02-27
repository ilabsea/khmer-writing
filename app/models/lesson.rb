class Lesson < ActiveRecord::Base
  belongs_to :grade

  has_many :contents

  has_many :writing_methods, through: :contents
  accepts_nested_attributes_for :contents
  mount_uploader :image_background, ImageUploader
end
