class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def show
    @user = User.find(params[:id])
    if current_user!=nil && @user.admin? && current_user.user?
      redirect_to feed_path
    else
      if !current_user  && @user.admin?
        redirect_to feed_path
      end
    end
  end
    
  # GET /users or /users.json
  def index
    (@filterrific = initialize_filterrific(
      User,
      params[:filterrific],
      select_options: {
        sorted_by: User.options_for_sorted_by,
      },
    )) || return
    @users = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
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
  puts(@user)
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
        # controllo di non star modificando email/psw o che l'account sia stato creato con email+psw
        if (@user.provider == nil or not (user_params.key? :email or user_params.key? :password or user_params.key? :password_confirmation)) and (not user_params.key? :avatar_url or user_params[:avatar_url].to_s.end_with?("png", "jpg", "jpeg")) and @user.update(user_params)
            bypass_sign_in(@user) # mantiene loggato l'utente dopo la modifica della password
            format.html { redirect_to user_url(@user), notice: "Account was successfully updated." }
            format.json { render :show, status: :ok, location: @profile }
        else
            # se l'account è stato creato tramite provider e sto cercando di modificarne email o psw
            if (@user.provider != nil) and (user_params.key? :email or user_params.key? :password or user_params.key? :password_confirmation)
                format.html { redirect_to user_url(@user), alert: "Can't update provider's credentials." }
            # se invece sto cercando di mettere un link qualsiasi al posto dell'immagine di profilo
            elsif user_params.key? :avatar_url and not user_params[:avatar_url].to_s.end_with?("png", "jpg", "jpeg")
                format.html { redirect_to user_url(@user), alert: "Profile picture must be an image." }
            else
                format.html { redirect_to user_url(@user), alert: @user.errors.full_messages.to_sentence }
            end
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
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :avatar_url)
    end
end