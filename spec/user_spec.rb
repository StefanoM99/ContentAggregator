require 'rails_helper'
require 'uri'

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
        let(:user) { User.create(:email => 'testo@test.com', :password => 'P4ssword', :password_confirmation => 'P4ssword', :name=>"Prova",:surname =>"Test") }
            it "return a success response" do 
      
            sign_in user
            get :show, params: {id: user.to_param}
      
            expect(response).to have_http_status(:ok)
        end
    end  
end    


RSpec.describe PostsController, type: :controller do

    context 'User tries to create a blank post' do
        it 'returns an error message' do
            expect {
                @post = Post.create!( author: "Prova" + ' ' + "Test", title: nil, summary: nil, post_file: nil)
            }.to  raise_error(ActiveRecord::RecordInvalid)
        end
    end

    context 'User tries to create a post w/out Titolo (Sommario)' do
        it 'returns an error message' do
            expect {
                @post = Post.create!( author: "Prova" + ' ' + "Test", title: nil, summary: "Mio riepilogo", post_file: nil)
            }.to  raise_error(ActiveRecord::RecordInvalid)
        end
    end

    context 'User tries to create a post w/out Titolo (Image)' do
        it 'returns an error message' do
            @post = Post.new

            expect {
                @post = Post.create!( author: "Prova" + ' ' + "Test", title: nil, summary: nil, post_file: nil)
            }.to  raise_error(ActiveRecord::RecordInvalid)

            @post.post_file.attach(io: File.open(Rails.root.join('spec', 'Tux.png')), filename: "Tux.png", content_type: "image/png")
        end
    end

    context 'User tries to create a post w/out Titolo (Sommario+Image)' do
        it 'returns an error message' do
            @post = Post.new

            expect {
                @post = Post.create!( author: "Prova" + ' ' + "Test", title: nil, summary: "Mio riepilogo", post_file: nil)
            }.to  raise_error(ActiveRecord::RecordInvalid)

            @post.post_file.attach(io: File.open(Rails.root.join('spec', 'test.txt')), filename: "test.txt", content_type: "text/plain")
        end
    end

    context 'User creates a post (Titolo)' do
        it 'returns a success message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: nil, post_file: nil)

            expect(@post.save!).to eq (true)
        end
    end

    context 'User creates a post (Titolo+Sommario)' do
        it 'returns a success message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Mio riepilogo", post_file: nil)

            expect(@post.save!).to eq (true)
        end
    end

    context 'User creates a post (Titolo+Image)' do
        it 'returns a success message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: nil, post_file: nil)

            expect(@post.save!).to eq (true)

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'Tux.png')), filename: "Tux.png", content_type: "image/png")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (true)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
        end
    end

    context 'User creates a post (Titolo+Sommario+Image)' do
        it 'returns a success message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Mio riepilogo", post_file: nil)

            expect(@post.save!).to eq (true)

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'Tux.png')), filename: "Tux.png", content_type: "image/png")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (true)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
        end
    end

    context 'User creates a post (Titolo+File)' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: nil, post_file: nil)

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'test.txt')), filename: "test.txt", content_type: "text/plain")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (false)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
        end
    end

    context 'User creates a post (Titolo+Sommario+File)' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Mio riepilogo", post_file: nil)

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'test.txt')), filename: "test.txt", content_type: "text/plain")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (false)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
        end
    end

    context 'User creates a post with a safe link' do
        it 'returns a success message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Innocuo https://www.google.it", post_file: nil)

            link = URI.extract(@post.summary)[0]

            expect(SafeBrowsing.is_it_safe?(link)).to eq (true)
            expect(@post.save!).to eq (true)
        end
    end

    context 'User tries to create a post with a malware link' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Malevolo https://testsafebrowsing.appspot.com/s/malware.html", post_file: nil)

            link = URI.extract(@post.summary)[0]

            expect(SafeBrowsing.is_it_safe?(link)).to eq (false)
        end
    end

    context 'User tries to create a post with a safe link and a malware link' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Innocuo https://www.google.it Malevolo https://testsafebrowsing.appspot.com/s/malware.html", post_file: nil)

            link1 = URI.extract(@post.summary)[0]
            link2 = URI.extract(@post.summary)[1]

            expect(SafeBrowsing.is_it_safe?(link1)).to eq (true)
            expect(SafeBrowsing.is_it_safe?(link2)).to eq (false)
        end
    end

    #-------------------------------------------------------------------------------------------------------------------------

    context 'User creates a post with a safe link with photo' do
        it 'returns a success message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Innocuo https://www.google.it", post_file: nil)

            link = URI.extract(@post.summary)[0]
            
            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'Tux.png')), filename: "Tux.png", content_type: "image/png")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (true)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
            expect(SafeBrowsing.is_it_safe?(link)).to eq (true)
            expect(@post.save!).to eq (true)
        end
    end

    context 'User tries to create a post with a malware link with photo' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Malevolo https://testsafebrowsing.appspot.com/s/malware.html", post_file: nil)

            link = URI.extract(@post.summary)[0]

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'Tux.png')), filename: "Tux.png", content_type: "image/png")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (true)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
            expect(SafeBrowsing.is_it_safe?(link)).to eq (false)
        end
    end

    context 'User tries to create a post with a safe link and a malware link with photo' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Innocuo https://www.google.it Malevolo https://testsafebrowsing.appspot.com/s/malware.html", post_file: nil)

            link1 = URI.extract(@post.summary)[0]
            link2 = URI.extract(@post.summary)[1]

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'Tux.png')), filename: "Tux.png", content_type: "image/png")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (true)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
            expect(SafeBrowsing.is_it_safe?(link1)).to eq (true)
            expect(SafeBrowsing.is_it_safe?(link2)).to eq (false)
        end
    end

    #---------------------------------------------------------------------------------------------------------------------------------------------

    context 'User creates a post with a safe link with file' do
        it 'returns a success message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Innocuo https://www.google.it", post_file: nil)

            link = URI.extract(@post.summary)[0]

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'test.txt')), filename: "test.txt", content_type: "text/plain")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (false)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
            expect(SafeBrowsing.is_it_safe?(link)).to eq (true)
            expect(@post.save!).to eq (true)
        end
    end

    context 'User tries to create a post with a malware link with file' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Malevolo https://testsafebrowsing.appspot.com/s/malware.html", post_file: nil)

            link = URI.extract(@post.summary)[0]

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'test.txt')), filename: "test.txt", content_type: "text/plain")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (false)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
            expect(SafeBrowsing.is_it_safe?(link)).to eq (false)
        end
    end

    context 'User tries to create a post with a safe link and a malware link with file' do
        it 'returns an error message' do
            @post = Post.new
            @post = Post.create!( author: "Prova" + ' ' + "Test", title: "Mio titolo", summary: "Innocuo https://www.google.it Malevolo https://testsafebrowsing.appspot.com/s/malware.html", post_file: nil)

            link1 = URI.extract(@post.summary)[0]
            link2 = URI.extract(@post.summary)[1]

            expect(@post.post_file.attach(io: File.open(Rails.root.join('spec', 'test.txt')), filename: "test.txt", content_type: "text/plain")).to eq (true)
            expect(@post.post_file.content_type == "image/png").to eq (false)
            expect(@post.post_file.content_type == "image/jpeg").to eq (false)
            expect(SafeBrowsing.is_it_safe?(link1)).to eq (true)
            expect(SafeBrowsing.is_it_safe?(link2)).to eq (false)
        end
    end
end
