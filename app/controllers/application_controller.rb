class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  add_breadcrumb "ទំពរ័ដើម", :root_path

  before_filter :set_request_header

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  private

  def render_writing_method_breadcrumb(method)
    render_writing_methods_breadcrumb
    add_breadcrumb method.name#, writing_method_path(method)
  end

  def render_writing_methods_breadcrumb
    add_breadcrumb 'វិធីសាស្រ្ត', writing_methods_path
  end

  def render_contents_breadcrumb(lesson, method)
    render_lesson_breadcrumb(lesson)
    add_breadcrumb method.name, lesson_contents_path(lesson_id: lesson, writing_method_id: method.id)
    add_breadcrumb 'ខ្លឹមសារ', lesson_contents_path(lesson_id: lesson, writing_method_id: method.id)
  end

  def render_grades_breadcrumb
    add_breadcrumb "ថ្នាក់", grades_path
  end

  def render_grade_breadcrumb(grade)
    render_grades_breadcrumb
    add_breadcrumb grade.name, grade_lessons_path(grade)
  end

  def render_lessons_breadcrumb(grade)
    render_grade_breadcrumb(grade)
    add_breadcrumb 'មេរៀន', grade_lessons_path(grade)
  end
  def render_lesson_breadcrumb(lesson)
    render_grade_breadcrumb(lesson.grade)
    add_breadcrumb 'មេរៀន', grade_lessons_path(lesson.grade)
    add_breadcrumb lesson.name, grade_lesson_path(lesson.grade, lesson)
  end


  def record_not_found(error)
    render :json => {:error => error.message}, :status => :not_found
  end

  def set_request_header
    headers['Access-Control-Allow-Origin'] = '*'
  end

end
