Given('I signed up as "prova@gmail.com"') do
    @user = User.new(:name => 'Test', :surname => 'Prova', :email => 'prova@gmail.com', :password => 'password', :password_confirmation => 'password')
    @user.save
end

Given('I signed in as "prova@gmail.com"') do
    @user = User.new(:name => 'Test', :surname => 'Prova', :email => 'prova@gmail.com', :password => 'password', :password_confirmation => 'password')
    @user.save
    visit path_to("home page")
    fill_in('E-Mail', :with => @user.email)
    fill_in('Password', :with => @user.password)
    click_button('Accedi')
end

# Given('I signed in as admin') do
#     @user = User.create(:name=>'admin', :surname =>'admin', :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :id=>0, :role=>1)
#     @user.save
#     visit path_to("home page")
#     fill_in('E-Mail', :with => @user.email)
#     fill_in('Password', :with => @user.password)
#     click_button('Accedi')
# end

Given('I signed in as admin') do
    begin
        if (User.find(0) != {})
            User.find(0).destroy
        end
    rescue
    ensure
        @user = User.create(:name=>'admin', :surname =>'admin', :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :id=>0, :role=>1)
        @user.save
        visit path_to("home page")
        fill_in('E-Mail', :with => @user.email)
        fill_in('Password', :with => @user.password)
        click_button('Accedi')
    end
end

Given('there are reported posts') do
    @reported_post = ReportedPost.all[0]
end

# Given('there is 1 reported post by "Autore DelPost" with title "Titolo" and summary "Sommario"') do
#     @author = User.new(:name => 'Autore', :surname => 'DelPost', :email => 'autore@gmail.com', :password => 'password', :password_confirmation => 'password')
#     @author.save
#     @post = Post.new(author: 'Autore DelPost', title: 'Titolo', summary: 'Sommario', post_file: nil, user_id: @author.id)
#     @post.save
#     @reported_post = ReportedPost.new(author: 'Autore DelPost', title: 'Titolo', summary: 'Sommario', post_file: nil, user_id: 1, post_id: @post.id)
#     @reported_post.save
# end

# Given('there is 1 reported post by {string} with title {string} and summary {string}') do |full_name, title, summary|
#     if (ReportedPost.all != {})
#         ReportedPost.all.each do |rep_post|
#             rep_post.destroy
#         end
#     end
#     name = full_name.split(" ")[0]
#     surname = full_name.split(" ")[1]
#     @author = User.new(:name => name, :surname => surname, :email => name+surname+'@gmail.com', :password => 'password', :password_confirmation => 'password')
#     @author.save
#     @post = Post.new(author: @author.name+" "+@author.surname, title: title, summary: summary, post_file: nil, user_id: @author.id)
#     @post.save
#     @reported_post = ReportedPost.new(author: @author.name+" "+@author.surname, title: title, summary: summary, post_file: nil, user_id: 1, post_id: @post.id)
#     @reported_post.save
# end

Given('there is 1 reported post by {string} with title {string} and summary {string}') do |full_name, title, summary|
    if (ReportedPost.all != {})
        ReportedPost.all.each do |rep_post|
            rep_post.destroy
        end
    end
    name = full_name.split(" ")[0]
    surname = full_name.split(" ")[1]
    begin
        if (User.find_by email: (name+surname+'@gmail.com')) != {}
            (User.find_by email: (name+surname+'@gmail.com')).destroy
        end
    rescue
    ensure
        @author = User.new(:name => name, :surname => surname, :email => name+surname+'@gmail.com', :password => 'password', :password_confirmation => 'password')
        @author.save
        @post = Post.new(author: @author.name+" "+@author.surname, title: title, summary: summary, post_file: nil, user_id: @author.id)
        @post.save
        @reported_post = ReportedPost.new(author: @author.name+" "+@author.surname, title: title, summary: summary, post_file: nil, user_id: 1, post_id: @post.id)
        @reported_post.save
    end
end

# Given('there are 2 reported posts by "Autore DelPost"') do
#     @author = User.new(:name => 'Autore', :surname => 'DelPost', :email => 'autore@gmail.com', :password => 'password', :password_confirmation => 'password')
#     @author.save
#     @post1 = Post.new(author: 'Autore DelPost', title: 'Titolo primo post', summary: 'Sommario', post_file: nil, user_id: @author.id)
#     @post1.save
#     @post2 = Post.new(author: 'Autore DelPost', title: 'Titolo secondo post', summary: 'Sommario', post_file: nil, user_id: @author.id)
#     @post2.save
#     @reported_post1 = ReportedPost.new(author: 'Autore DelPost', title: 'Titolo primo post', summary: 'Sommario', post_file: nil, user_id: 1, post_id: @post1.id)
#     @reported_post1.save
#     @reported_post2 = ReportedPost.new(author: 'Autore DelPost', title: 'Titolo secondo post', summary: 'Sommario', post_file: nil, user_id: 1, post_id: @post2.id)
#     @reported_post2.save
# end

# Given('there are {int} reported posts by "Autore DelPost"') do |int|
#     @author = User.new(:name => 'Autore', :surname => 'DelPost', :email => 'autore@gmail.com', :password => 'password', :password_confirmation => 'password')
#     @author.save
#     for i in 1..int do
#         @post = Post.new(author: 'Autore DelPost', title: 'Titolo post '+(i).to_s, summary: 'Sommario', post_file: nil, user_id: @author.id)
#         @post.save
#         @reported_post = ReportedPost.new(author: 'Autore DelPost', title: 'Titolo post '+(i).to_s, summary: 'Sommario', post_file: nil, user_id: 1, post_id: @post.id)
#         @reported_post.save
#     end
# end

Given('there are {int} reported posts by {string}') do |int, string|
    if (ReportedPost.all != {})
        ReportedPost.all.each do |rep_post|
            rep_post.destroy
        end
    end
    name = string.split(" ")[0]
    surname = string.split(" ")[1]
    @author = User.new(:name => name, :surname => surname, :email => name+surname+'@gmail.com', :password => 'password', :password_confirmation => 'password')
    @author.save
    for i in 1..int do
        @post = Post.new(author: @author.name+" "+@author.surname, title: 'Titolo '+(i).to_s+' post ', summary: 'Sommario', post_file: nil, user_id: @author.id)
        @post.save
        @reported_post = ReportedPost.new(author: 'Autore DelPost', title: 'Titolo '+(i).to_s+' post ', summary: 'Sommario', post_file: nil, user_id: 1, post_id: @post.id)
        @reported_post.save
    end
end

# Then('I should be logged in as "test@gmail.com"') do
#     @user = User.find_by email: 'test@gmail.com'
# end

# Then('I should be logged in as "prova@gmail.com"') do
#     @user = User.find_by email: 'prova@gmail.com'
# end

When('I upload an image') do
    page.attach_file('app/assets/images/logo.png') do
        page.find('#post_post_file').click
    end
end

Then('I should see the image I uploaded') do
    page.find(class: 'articleimg')['src'].end_with?("logo.png")
end

When('I upload a video') do
    page.attach_file('app/assets/videos/video.mp4') do
        page.find('#post_post_file').click
    end
end

Then('I should see the video I uploaded') do
    page.find('video')['src'].end_with?("video.mp4")
end

When('I upload a text file') do
    page.attach_file('app/assets/file.txt') do
        page.find('#post_post_file').click
    end
end

Then('I should see {int} {string}') do |int, string|
    expect(page).to have_content(string, :count => int)
end

When(/^(?:|I )press first "([^"]*)"$/) do |button|
    first(:button, button).click
end