class CodesController < ApplicationController
  def index
    @codes = Code.eager_load(:user).order(created_at: :desc)
  end

  def show; end

  def new
    @code = Code.new
  end

  def edit
    @code = Code.find(params[:id])
    @favorite = current_user.favorites.find_by(code_id: @code.id)
  end

  def create
    @code = Code.new(code_params)
    @code.user = current_user
    if @code.save
      flash[:notice] = t('flash.code.create')
      redirect_to codes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @code = Code.find(params[:id])
    if @code.update(code_params)
      flash[:notice] = t('flash.code.update')
      redirect_to codes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @code = Code.find(params[:id])
    @code.destroy!
    flash[:notice] = t('flash.code.destroy')
    redirect_to codes_path
  end

  private

  def code_params
    params.require(:code).permit(:title, :body_html, :body_css, :body_js, :is_public, :image)
  end
end
