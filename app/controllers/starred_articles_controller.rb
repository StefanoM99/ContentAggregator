class StarredArticlesController < ApplicationController
  before_action :set_starred_article, only: %i[ show edit update destroy ]

  # GET /starred_articles or /starred_articles.json
  def index
   

  end

  # GET /starred_articles/1 or /starred_articles/1.json
  def show
  
  end

  # GET /starred_articles/new
  def new
  
    @starred_article = StarredArticle.new
  end

  # GET /starred_articles/1/edit
  def edit
  end

  # POST /starred_articles or /starred_articles.json
  def create
    puts("AOOOOOO \n")
    
   
    @starred_article=StarredArticle.new(article_id:params[:article_id],
                                        user_id:current_user.id,
                                        country: params[:country], 
                                        category: params[:category],
                                        source: params[:source],
                                        author: params[:author],
                                        title: params[:title],
                                        description: params[:description],
                                        summary: params[:summary],
                                        link: params[:link],
                                        media: params[:media] ,
                                        publication: params[:publication]
                                        
                                      )
 

    respond_to do |format|
      if @starred_article.save
        format.html { redirect_to starred_article_url(@starred_article), notice: "Starred article was successfully created." }
        format.json { render :show, status: :created, location: @starred_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @starred_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starred_articles/1 or /starred_articles/1.json
  def update
    respond_to do |format|
      if @starred_article.update(starred_article_params)
        format.html { redirect_to starred_article_url(:user_id => @starred_article.user_id), notice: "Starred article was successfully updated." }
        format.json { render :show, status: :ok, location: @starred_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @starred_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starred_articles/1 or /starred_articles/1.json
  def destroy
    @starred_article.destroy

    respond_to do |format|
      format.html { redirect_to starred_articles_url(:user_id => @starred_article.user_id), notice: "Starred article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starred_article
      @starred_article = StarredArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def starred_article_params
      params.fetch(:starred_article, {}).permit(:article_id, :user_id)
    end
end
