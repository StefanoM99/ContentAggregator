class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def show
    @user = User.find(params[:id])
    if @user.admin? && current_user.user?
      redirect_to feed_path
    end
  end
    
  # GET /users or /users.json
  def index
  end
      
  # GET /profiles/1 or /profiles/1.json
        
  # GET /profiles/new
  def new
    @user = User.new
  end
      
  # GET /profiles/1/edit
  def edit
  end
      
  # POST /profiles or /profiles.json
  def create
    @user = User.new(user_params)
      
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
      
  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if (@user.provider == nil) and @user.update(user_params) 
        format.html { redirect_to "/feed", notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        #format.html { render :edit, status: :unprocessable_entity }
        format.html {  }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
      
  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @user.destroy
      
    respond_to do |format|
      format.html { redirect_to "/home", notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end
      
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
      
    # Only allow a list of trusted parameters through.
    def profile_params
      params.fetch(:profile, {})
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end