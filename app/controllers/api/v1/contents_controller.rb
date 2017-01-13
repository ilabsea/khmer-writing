module Api::V1
  class ContentsController < ApplicationController
    def index
      contents = Lesson.find(params[:lesson_id]).contents.where(writing_method: params[:writing_method_id])
      render json: contents
    end

  end
end
