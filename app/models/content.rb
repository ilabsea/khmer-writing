class Content < ActiveRecord::Base
  belongs_to :writing_method
  belongs_to :lesson
  mount_uploader :image, ImageUploader
  mount_uploader :image_clue, ImageClueUploader
  mount_uploader :image_answer, ImageAnswerUploader
  mount_uploader :audio, AudioUploader
end
