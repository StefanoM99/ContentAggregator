
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
    @user = User.create(:email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :name=>"admin",:surname =>"admin",:id=>0, :role=>1)
    

    @user.save
    @user = nil
  end
  
end
