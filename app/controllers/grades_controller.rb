class GradesController < ApplicationController
  before_filter :authorize

  def index
    render_grades_breadcrumb
    @grades = Grade.all
  end

  def new
    render_grades_breadcrumb
    add_breadcrumb "បន្ថែមថ្នាក់ថ្មី"
    @grade = Grade.new
  end

  def edit
    @grade = Grade.find(params[:id])
    render_grade_breadcrumb(@grade)
    add_breadcrumb "កែសម្រួលថ្នាក់"
  end

  def create
    @grade = Grade.new(grade_params)

    @grade.save
    redirect_to @grade
  end

  def show
    @grade = Grade.find(params[:id])
    @lessons = @grade.lessons
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
