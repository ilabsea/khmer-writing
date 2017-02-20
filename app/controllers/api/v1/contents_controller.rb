module Api::V1
  class ContentsController < ApplicationController
    def index
      contents = Lesson.find(params[:lesson_id]).contents
      render json: contents
    end

  end
end
