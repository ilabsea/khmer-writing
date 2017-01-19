class WritingMethodsController < ApplicationController
  before_filter :authorize

  def index
    render_writing_methods_breadcrumb
    @methods = WritingMethod.all
  end

  def new
    render_writing_methods_breadcrumb
    add_breadcrumb 'បន្ថែមវិធីសាស្រ្តថ្មី'
    @method = WritingMethod.new
  end

  def edit
    @method = WritingMethod.find(params[:id])
    render_writing_method_breadcrumb(@method)
    add_breadcrumb 'កែសម្រួលវិធីសាស្រ្ត'
  end

  def create
    @method = WritingMethod.new(params.require(:writing_method).permit(:name, :icon))
    if @method.save
      redirect_to writing_methods_path
    else
      render :new
    end
  end

  def show
    @method = WritingMethod.find(params[:id])
  end

  def update
    @method = WritingMethod.find(params[:id])
    if @method.update(methods_params)
      redirect_to @method
    else
      render 'edit'
    end
  end

  def destroy
    @method = WritingMethod.find(params[:id])
    @method.destroy

    redirect_to writing_methods_path
  end

  private

  def methods_params
    params.require(:writing_method).permit(:name, :code, :icon)
  end
end
