class LessonsController < ApplicationController
  before_filter :authorize

  def index
    @grade = Grade.find(params[:grade_id])
    @lessons = @grade.lessons
    render_lessons_breadcrumb(@grade)
  end

  def new
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.build
    render_lessons_breadcrumb(@grade)
    add_breadcrumb 'បន្ថែមមេរៀនថ្មី'
  end

  def create
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.create(lesson_params)
    redirect_to grade_path(@grade)
  end

  def show
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:id])
    @methods = WritingMethod.all
    render_lesson_breadcrumb(@lesson)
    add_breadcrumb 'វិធីសាស្រ្ត', grade_lesson_path(@grade.id, @lesson)
  end

  def edit
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:id])
    render_lesson_breadcrumb(@lesson)
    add_breadcrumb 'កែសម្រួលមេរៀន'
  end

  def update
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to grade_path(@grade)
    else
      render 'edit'
    end

  end

  def destroy
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:id])
    @lesson.destroy
    redirect_to grade_path(@grade)
  end

  private
    def lesson_params
      params.require(:lesson).permit(:name, :code, :khmer_numeric)
    end
end
