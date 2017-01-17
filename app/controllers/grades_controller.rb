class GradesController < ApplicationController
  before_filter :authorize

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def create
    @grade = Grade.new(grade_params)

    @grade.save
    redirect_to @grade
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    @grade.update(grade_params)

    redirect_to @grade
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    redirect_to grades_path
  end


  private
  def grade_params
    params.require(:grade).permit(:name, :code)
  end
end
