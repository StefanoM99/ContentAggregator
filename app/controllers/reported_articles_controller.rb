class ReportedArticlesController < ApplicationController
  before_action :set_reported_article, only: %i[ show edit update destroy ]

  # GET /reported_articles or /reported_articles.json
  def index
    @reported_articles = ReportedArticle.all
    @user = User.find(params[:user_id])
    if current_user!=nil && @user.admin? && current_user.user?
      redirect_to feed_path
    else
      if !current_user  && @user.admin?
        redirect_to feed_path
      end
    end
  end

  # GET /reported_articles/1 or /reported_articles/1.json
  def show
   
  end

  # GET /reported_articles/new
  def new
    @reported_article = ReportedArticle.new
  end

  # GET /reported_articles/1/edit
  def edit
  end

  # POST /reported_articles or /reported_articles.json
  def create
    @reported_article = ReportedArticle.create(
      country: params[:country], 
      category: params[:category],
      source: params[:source],
      author: params[:author],
      title: params[:title],
      description: params[:description],
      summary: params[:summary],
      link: params[:link],
      media: params[:media],
      publication: params[:publication],
      article_id: params[:article_id],
      user_id:current_user.id
    )
  
  
      if @reported_article.save
       
        
      else
        
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reported_article.errors, status: :unprocessable_entity }
      end
  
  end
  

  # PATCH/PUT /reported_articles/1 or /reported_articles/1.json
  def update
    respond_to do |format|
      if @reported_article.update(reported_article_params)
        format.html { redirect_to reported_article_url(:user_id => @reported_article.user_id), notice: "Reported article was successfully updated." }
        format.json { render :show, status: :ok, location: @reported_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reported_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reported_articles/1 or /reported_articles/1.json
  def destroy
    if !SavedArticle.where(article_id:@reported_article.article_id,type:"StarredArticle").empty? && current_user.admin?
      @saved_article = SavedArticle.where(article_id:@reported_article.article_id,type:"StarredArticle")
      @saved_article.destroy_all
    
    
    end
    if !SavedArticle.where(article_id:@reported_article.article_id,type:"ReportedArticle").empty? && current_user.admin?
    @reported_articles = SavedArticle.where(article_id:@reported_article.article_id,type:"ReportedArticle")
    @reported_articles.destroy_all
    end
    @reported_article.destroy
    respond_to do |format|
      if current_user.admin?
          @article = Article.find(@reported_article.article_id)
          @blacklist = Blacklist.create(
            title: @reported_article.title,    
            description: @reported_article.description,
            summary: @reported_article.summary,
            tipo: "Article"
          )
          
          @article.destroy
          format.html {redirect_to request.referrer }
          format.json { head :no_content }
      else 
          format.html { redirect_to request.referrer}
          format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reported_article
      @reported_article = ReportedArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reported_article_params
      params.fetch(:reported_article, {}).permit(:article_id)
    end
end
