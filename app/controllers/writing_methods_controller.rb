class WritingMethodsController < ApplicationController
  before_filter :authorize

  def index
    @methods = WritingMethod.all
  end

  def new
    @method = WritingMethod.new
  end

  def edit
    @method = WritingMethod.find(params[:id])
  end

  def create
    @method = WritingMethod.new(params.require(:writing_method).permit(:name, :icon))

    @method.save
    redirect_to @method
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

    redirect_to methods_path
  end

  private

  def methods_params
    params.require(:writing_method).permit(:name, :code, :icon)
  end
end
