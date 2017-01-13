module Api::V1
  class LessonsController < ApplicationController

    def index
      lessons = Grade.find(params[:grade_id]).lessons
      render json: lessons
    end

  end
end
