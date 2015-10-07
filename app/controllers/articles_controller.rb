class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.search(params[:article_search]).page(params[:page]).per(10).order(:id)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    if user_signed_in?
      @article = Article.new
    else
      respond_to do |format|
        format.html { render :index, notice: 'ツイッターにてログイン後に投稿してください。' }
      end
    end
  end

  # GET /articles/1/edit
  def edit

    if !(@article.user_id == current_user.id)
      respond_to do |format|
        format.html { render :show, notice: 'この投稿は変更できません。' }
      end
    end

  end

  # POST /articles
  # POST /articles.json
  def create

    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save

        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update

    if !(@article.user_id == current_user.id)
      respond_to do |format|
        format.html { render :show, notice: 'この投稿は変更できません。' }
      end
    else
      respond_to do |format|

        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy

    if !(@article.user_id == current_user.id)
      respond_to do |format|
        format.html { render :show, notice: 'この投稿は変更できません。' }
      end
    else
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:message, :close_flag, :user_id, :member_id, :obverse_photo, :obverse_photo_cache, :remove_obverse_photo, :reverse_photo, :reverse_photo_cache, :remove_reverse_photo, requestmembers_attributes: [:id, :member_id, :_destroy])
    end
end
