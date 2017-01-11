class Content < ActiveRecord::Base
  belongs_to :writing_method
  belongs_to :lesson
  mount_uploader :image, ImageUploader
  mount_uploader :clue, ClueUploader
  mount_uploader :audio, AudioUploader
end
