class SavedArticlesController < ApplicationController
  before_action :set_saved_article, only: %i[ show edit update destroy ]

  # GET /saved_articles or /saved_articles.json
  def index
    @saved_articles = SavedArticle.all
  end

  # GET /saved_articles/1 or /saved_articles/1.json
  def show
  end

  # GET /saved_articles/new
  def new
    @saved_article = SavedArticle.new
  end

  # GET /saved_articles/1/edit
  def edit
  end

  # POST /saved_articles or /saved_articles.json
  def create
    @saved_article = SavedArticle.new(saved_article_params)

    respond_to do |format|
      if @saved_article.save
        format.html { redirect_to saved_article_url(@saved_article), notice: "Saved article was successfully created." }
        format.json { render :show, status: :created, location: @saved_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saved_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_articles/1 or /saved_articles/1.json
  def update
    respond_to do |format|
      if @saved_article.update(saved_article_params)
        format.html { redirect_to saved_article_url(@saved_article), notice: "Saved article was successfully updated." }
        format.json { render :show, status: :ok, location: @saved_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saved_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_articles/1 or /saved_articles/1.json
  def destroy
    @saved_article.destroy

    respond_to do |format|
      format.html { redirect_to saved_articles_url, notice: "Saved article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_article
      @saved_article = SavedArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saved_article_params
      params.require(:saved_article).permit(:type, :country, :category, :source, :author, :title, :description, :summary, :link, :media, :publication)
    end
end
