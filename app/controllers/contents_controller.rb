class ContentsController < ApplicationController

  def index
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:lesson_id])
    @method = WritingMethod.find(params[:writing_method_id])
    @contents = @lesson.contents.where(:writing_method_id => params[:writing_method_id])
    p @contents
  end

  def new
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:lesson_id])
    @method = WritingMethod.find(params[:writing_method_id])
    @content = @lesson.contents.new
  end

  def create
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:lesson_id])
    @method = WritingMethod.find(params[:writing_method_id])
    p "content_params : ", content_params
    @content.writing_method_id = params[:writing_method_id]
    @content = @lesson.contents.create(content_params)
    redirect_to grade_lesson_writing_method_contents_path(@grade, @lesson, @method)
  end

  def edit
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:lesson_id])
    @method = WritingMethod.find(params[:writing_method_id])
    @content = @lesson.contents.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:grade_id])
    @lesson = @grade.lessons.find(params[:lesson_id])
    @content = @lesson.contents.find(params[:id])
    @method = WritingMethod.find(params[:writing_method_id])

    if @content.update(content_params)
      redirect_to grade_lesson_writing_method_contents_path(@grade, @lesson, @method)
    else
      render 'edit'
    end

  end

  def destroy
    @content = Content.find(params[:id])
    @method = WritingMethod.find(params[:writing_method_id])
    @content.destroy
    redirect_to grade_lesson_writing_method_contents_path(@grade, @lesson, @method)
  end

  private
  def content_params
    params.require(:content).permit(:content, :content_in_khmer)
  end
end
