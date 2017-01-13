module Api::V1
  class WritingMethodsController < ApplicationController

    def index
      writing_methods = Lesson.find(params[:lesson_id]).writing_methods
      render json: writing_methods
    end

  end
end
