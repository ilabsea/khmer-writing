class Content < ActiveRecord::Base
  belongs_to :writing_method
  belongs_to :lesson
  mount_uploader :image, ImageUploader
  mount_uploader :image_clue, ImageClueUploader
  mount_uploader :image_answer, ImageAnswerUploader
  mount_uploader :audio, AudioUploader

  validates :content, presence: true
  validates :image_clue, presence: true
  validates :audio, presence: true
  validates :image_answer, presence: true
  validates :image, presence: true
end
