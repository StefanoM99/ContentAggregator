class ArticleCommentsController < ApplicationController
  before_action :set_article_comment, only: %i[ show edit update destroy ]

  # GET /article_comments or /article_comments.json
  def index
    @article_comments = ArticleComment.all
  end

  # GET /article_comments/1 or /article_comments/1.json
  def show
  end

  # GET /article_comments/new
  def new
    @article_comment = ArticleComment.new
  end

  # GET /article_comments/1/edit
  def edit
  end

  # POST /article_comments or /article_comments.json
  def create
    @article_comment = ArticleComment.new(
      author: current_user.name + ' ' + current_user.surname,
      description: article_comment_params[:description],
      article_id: params[:article_id],
      user_id: current_user.id
    )

    respond_to do |format|
      if @article_comment.save
        format.html { redirect_to article_comment_url(@article_comment), notice: "Article comment was successfully created." }
        format.json { render :show, status: :created, location: @article_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_comments/1 or /article_comments/1.json
  def update
    respond_to do |format|
      if @article_comment.update(article_comment_params)
        format.html { redirect_to article_comment_url(@article_comment), notice: "Article comment was successfully updated." }
        format.json { render :show, status: :ok, location: @article_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_comments/1 or /article_comments/1.json
  def destroy
    @article_comment.destroy

    respond_to do |format|
      format.html { redirect_to article_comments_url, notice: "Article comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_comment
      @article_comment = ArticleComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_comment_params
      params.require(:article_comment).permit(:author, :description, :user_id, :article_id)
    end
end
