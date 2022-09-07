class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy ]

  # GET /feeds or /feeds.json
  def index
    for index_feeds_on_article_id in 0..Article.all.length-1 do
      for index_feeds_on_forecast_id in 0..Forecast.all.length do
        for index_feeds_on_post_id in 0..Post.all.length-1 do
          @feeds = Feed.create(
            article_id: Article.all[index_feeds_on_article_id].id, 
            forecast_id: Forecast.all[index_feeds_on_forecast_id].id, 
            post_id: Post.all[index_feeds_on_post_id].id
          )
        end
      end
    end
  end

  # GET /feeds/1 or /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds or /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to feed_url(@feed), notice: "Feed was successfully created." }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1 or /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to feed_url(@feed), notice: "Feed was successfully updated." }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1 or /feeds/1.json
  def destroy
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url, notice: "Feed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feed_params
      params.require(:feed).permit(:article_id, :forecast_id, :post_id)
    end
end
