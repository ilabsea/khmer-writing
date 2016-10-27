class Content < ActiveRecord::Base
  belongs_to :writing_method
  belongs_to :lesson
end
