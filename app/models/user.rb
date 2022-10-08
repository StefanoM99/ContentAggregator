class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2,:twitter]
   
        validates :name, presence: true
        validates :surname, presence: true
        validates :email, presence: true
        validates :encrypted_password, presence: true
        
      has_many :starred_playlists
      has_many :playlists
      has_many :starred_articles
      has_many :articles
        def self.from_omniauth(access_token)
          puts access_token.info
          where(email: access_token.info.email).first_or_create do |user|
            user.email= access_token.info.email
            user.name = access_token.info.first_name
            user.surname=access_token.info.last_name
            user.password =  Devise.friendly_token[0,20]
            user.full_name = access_token.info.name
            user.avatar_url = access_token.info.image
            user.uid = access_token.uid
            user.provider = access_token.provider
           #user.name = access_token.info.name
          end
          # Uncomment the section below if you want users to be created if they don't exist
       
      end

      def self.from_omniauth_twitter(auth)
        
        where(email: auth.info.email).first_or_create do |user|
        puts(auth.provider)
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name # assuming the user model has a name
        user.surname = auth.info.nickname 
        user.full_name= auth.info.name
        user.uid = auth.uid
        user.avatar_url = auth.info.image
        user.provider = auth.provider# assuming the user model has a username
        #user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
        end
      end

    
    
end 
