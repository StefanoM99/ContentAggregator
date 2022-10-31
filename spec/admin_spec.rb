require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!
RSpec.describe HomeController, type: :controller do
  context "GET /index" do
    it "return a success response" do 
      get :index
      
      expect(response).to have_http_status(:ok)
    end
  end  
end    



RSpec.describe UsersController, type: :controller do
  context "GET /show user and admin" do
    let(:user) { User.create(:email => 'testo@test.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"test",:surname =>"test") }
    it "return a success response" do 
      
      sign_in user
      get :show, params: {id: user.to_param}
      
      expect(response).to have_http_status(:ok)
    end
  end  
end    



RSpec.describe PostsController, type: :controller do

  context "create a post" do
    let(:post) { Post.create(title:"Test") }
    it "return a success response" do

      expect(post.save!).to eq (true)
    end
  end 
  
  context "delete a post" do
    let(:post) { Post.create(title:"Test") }
   
    it "return a success response" do
      post.save!
      expect{post.destroy!}.to change { Post.count }.by(-1)
    end
  end  

end 


RSpec.describe ReportedPostsController, type: :controller do

  context "create a reported post" do
    let(:user) { User.create(:email => 'testo@test.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"test",:surname =>"test") }
    let(:post) { Post.create(title:"Test") }
    it "return a success response" do
      
      @reported_post = SavedPost.create(type:"ReportedPost",title:post.title,post_id:  post.id, user_id: user.id)
      @reported_post.save!
      
      expect(@reported_post.save!).to eq (true)
      expect(SavedPost.where(type:"ReportedPost")).to include(@reported_post)
    end
  end  

  context "delete a reported post" do
    let(:user) { User.create(:email => 'testo@test.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"test",:surname =>"test") }
    let(:post) { Post.create(title:"Test") }
    
    let(:reported_post) { SavedPost.create(type:"ReportedPost",post_id:post.id,user_id:user.id) }
    it "return a success response" do
      reported_post.save!
      expect{reported_post.destroy!}.to change { SavedPost.count }.by(-1)
      expect(SavedPost.all).not_to include(reported_post)
    end
  end  


end 


RSpec.describe UsersController, type: :controller do
  context "delete a reported article" do
  let(:admin) {User.create(:email => 'admin@admin.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"test",:surname =>"test",:role=>1)}
  let(:userr) {User.create(:email => 'test@test.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"test",:surname =>"test")}
  let(:article) { Article.create }
  let(:reported_article) { SavedArticle.create(type:"ReportedArticle",article_id:article.id,user_id:userr.id) }
  
 
  it "return a success response " do

    reported_article.save!
    
    expect(response).to have_http_status(:ok)
    expect{reported_article.destroy!}.to change { SavedArticle.count }.by(-1)
  end
  
  it "add it to blacklist" do 
    blacklist = Blacklist.create
    blacklist.save!
    expect{blacklist.destroy!}.to change { Blacklist.count }.by(-1)
  end
end


context "delete a reported playlist" do
  let(:admin) {User.create(:email => 'admin@admin.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"test",:surname =>"test",:role=>1)}
  let(:userr) {User.create(:email => 'test@test.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"test",:surname =>"test")}
  let(:playlist) { Playlist.create }
  let(:reported_playlist) { SavedPlaylist.create(type:"ReportedPlaylist",playlist_id:playlist.id,user_id:userr.id) }
  
 
  it "return a success response " do

    reported_playlist.save!
    
    expect(response).to have_http_status(:ok)
    expect{reported_playlist.destroy!}.to change { SavedPlaylist.count }.by(-1)
  end
  
  it "add it to blacklist" do 
    blacklist = Blacklist.create
    blacklist.save!
    expect{blacklist.destroy!}.to change { Blacklist.count }.by(-1)
  end
end



end