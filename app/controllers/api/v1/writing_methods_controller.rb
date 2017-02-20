module Api::V1
  class WritingMethodsController < ApplicationController

    def index
      writing_methods = WritingMethod.all
      render json: writing_methods
    end

  end
end
