class UserController < ApplicationController
  def index
  end
  def registration
  end

  def new
    @user =User.new
  end

  
  def create
    @user = User.new(user_params)
  
     @user.save
    
  end
  
    private
      def user_params
        params.permit(:name, :surname, :mail,:password)
      end
  end
  



