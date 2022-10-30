
class HomeController < ApplicationController
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def index
    if current_user
      redirect_to feed_path
    end
    @user = User.create(:email => 'admin@admin.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"admin",:surname =>"admin",:id=>0, :role=>1)
    

    @user.save
    @user = nil
  end
  
end
