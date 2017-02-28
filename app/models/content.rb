class Content < ActiveRecord::Base
  belongs_to :writing_method
  belongs_to :lesson
  mount_uploader :image, ImageUploader
  mount_uploader :image_clue, ImageClueUploader
  mount_uploader :image_answer, ImageAnswerUploader
  mount_uploader :audio, AudioUploader

  validates :content, presence: true
  validates :image_clue, presence: true, :if => lambda { |o| o.writing_method.code == 4 }
  validates :audio, presence: true, :if => lambda { |o| o.writing_method.code == 3 }
  validates :image_answer, presence: true, :if => lambda { |o| (o.writing_method.code == 3 || o.writing_method.code == 4) }
  validates :image, presence: true, :if => lambda { |o| (o.writing_method.code == 1 || o.writing_method.code == 2 || o.writing_method.code == 4) }


end
