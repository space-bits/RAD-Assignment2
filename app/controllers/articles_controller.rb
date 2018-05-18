class ArticlesController < ApplicationController
  # don't require login to view articles, only to create, edit, and destroy
  skip_before_action :require_login, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @articles = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @articles = Article.new(articles_params)

    respond_to do |format|
      if @articles.save
        format.html { redirect_to @articles, notice: 'articles article posted, more at 5.' }
        format.json { render :show, status: :created, location: @articles }
      else
        format.html { render :new }
        format.json { render json: @articles.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @articles.update(articles_params)
        format.html { redirect_to @articles, notice: 'This just in, articles has been changed!' }
        format.json { render :show, status: :ok, location: @articles }
      else
        format.html { render :edit }
        format.json { render json: @articles.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @articles.destroy
    respond_to do |format|
      format.html { redirect_to articles_index_url, notice: 'Removed your article!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articles
      @articles = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articles_params
      params.require(:article).permit(:by, :text, :url, :title)
    end
end
