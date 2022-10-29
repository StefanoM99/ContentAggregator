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

Given('there are reported posts') do
    @reported_post = ReportedPost.all[0]
end

Then('I should be logged in as "test@gmail.com"') do
    @user = User.find_by email: 'test@gmail.com'
end

Then('I should be logged in as "prova@gmail.com"') do
    @user = User.find_by email: 'prova@gmail.com'
end

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