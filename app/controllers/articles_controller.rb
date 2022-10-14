class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /articles or /articles.json
  def index
    require 'open-uri'
    require 'geocoder'

    remote_ip = URI.open('https://ident.me').read
    
    ActiveRecord::Base.connection.execute(
      "DELETE from sqlite_sequence where name = 'articles'"
    )
      
    
    url = 'https://newsapi.org/v2/top-headlines'
    uri = URI.parse(url)
    query = Rack::Utils.parse_query(uri.query)
    
    if (params[:country] == nil && params[:category] == nil) || (params[:country] == '' && params[:category] == '')
      query["country"] = Geocoder.search(remote_ip).first.country_code
      query["category"] = "general"
    else
      query["country"] = params[:country]
      query["category"] = params[:category]
    end

    query["apiKey"] = Rails.application.credentials.dig(:newsapi, :apiKey)

    uri.query = Rack::Utils.build_query(query)
    optUrl = uri.to_s

    req = URI.open(optUrl)
    response_body = req.read
    data = JSON.parse(response_body)

    data["articles"].each do |item|
      if Article.where(author: item["author"],
        title: item["title"],
        description: item["description"]).empty?
      Article.create(
        country: query["country"],
        category: query["category"],
        source: item["source"]["name"],
        author: item["author"],
        title: item["title"],
        description: item["description"],
        summary: item["content"],
        link: item["url"],
        media: item["urlToImage"],
        publication: item["publishedAt"],
        
        
      )
    end
  end
    @articles = Article.all.reverse()
    
  end

  # GET /articles/1 or /articles/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.fetch(:article, {}).permit(:country, :category, 
        :source, :author, :title, :description, 
        :summary, :link, :media, :publication)
    end
end
