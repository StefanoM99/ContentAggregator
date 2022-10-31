@avatar_admin = "https://pixabay.com/illustrations/rocket-space-spaceman-drawing-2887845/"
@avatar1 = "https://cdn.pixabay.com/photo/2022/09/15/11/14/sea-7456253__480.jpg"
@avatar2 = "https://cdn.pixabay.com/photo/2021/03/14/11/15/footprints-6093999__480.jpg"
@avatar3 = "https://cdn.pixabay.com/photo/2022/09/18/18/09/leaves-7463742__480.png"
@avatar4 = "https://cdn.pixabay.com/photo/2022/09/25/09/58/houses-7477950__480.jpg"
@avatar5 = "https://cdn.pixabay.com/photo/2022/09/16/09/22/fish-7458229__480.png"

@admin = User.new(:name => 'Admin', :surname => 'Zero', :email => "admin", :password => 'P4ssword', :password_confirmation => 'P4ssword', :created_at => "2022-01-01 00:00:00.000000", :avatar_url => @avatar_admin, :role => 1)
@admin.save

@user = User.new(:name => 'Utente', :surname => 'Uno', :email => "utente1", :password => 'P4ssword', :password_confirmation => 'P4ssword', :created_at => "2022-10-22 22:37:52.253068", :avatar_url => @avatar1)
@user.save

@user = User.new(:name => 'Utente', :surname => 'Due', :email => "utente2", :password => 'P4ssword', :password_confirmation => 'P4ssword', :created_at => "2022-10-24 22:37:52.253068", :avatar_url => @avatar2)
@user.save

@user = User.new(:name => 'Utente', :surname => 'Tre', :email => "utente3", :password => 'P4ssword', :password_confirmation => 'P4ssword', :created_at => "2022-10-26 22:37:52.253068", :avatar_url => @avatar3)
@user.save

@user = User.new(:name => 'Utente', :surname => 'Quattro', :email => "utente4", :password => 'P4ssword', :password_confirmation => 'P4ssword', :created_at => "2022-10-29 22:37:52.253068", :avatar_url => @avatar4)
@user.save

@user = User.new(:name => 'Utente', :surname => 'Cinque', :email => "utente5", :password => 'P4ssword', :password_confirmation => 'P4ssword', :created_at => "2022-10-31 22:37:52.253068", :avatar_url => @avatar5)
@user.save

User.where(role: "user").each do |user|
    for i in 1..6
        @post = Post.new(author: user.name+" "+user.surname, title: "Titolo "+i.to_s+" post", summary: "Sommario "+i.to_s+" post", post_file: nil, user_id: user.id)
        @post.save
    end
end