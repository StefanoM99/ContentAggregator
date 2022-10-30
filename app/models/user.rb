class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2,:twitter]
   
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  #validate :password_complexity
  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, "deve contenere almeno una lettera minuscola, una lettera maiuscola e un numero"
    end
  end
      
  has_many :posts, dependent: :destroy
  has_many :starred_posts, dependent: :destroy
  has_many :reported_posts, dependent: :destroy
  has_many :playlists
  has_many :starred_playlists, dependent: :destroy
  has_many :reported_playlists, dependent: :destroy
  has_many :articles
  has_many :starred_articles, dependent: :destroy
  has_many :reported_articles, dependent: :destroy
  # Following Users
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :following_users

  enum role:[:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def self.from_omniauth(access_token)
    puts access_token.info
    where(email: access_token.info.email).first_or_create do |user|
      user.email= access_token.info.email
      user.name = access_token.info.first_name
      user.surname=access_token.info.last_name
      user.password =  Devise.friendly_token[0,20]
      #user.full_name = access_token.info.name
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
    #user.full_name= auth.info.name
    user.uid = auth.uid
    user.avatar_url = auth.info.image
    user.provider = auth.provider# assuming the user model has a username
    #user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end

  filterrific(
    default_filter_params: { sorted_by: "created_at_desc" },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_created_at_gte,
    ],
  )

  scope :search_query, ->(query) {
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.to_s.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(users.name) LIKE ?",
          "LOWER(users.surname) LIKE ?",
          "LOWER(users.email) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, ->(sort_option) {
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    users = User.arel_table
    case sort_option.to_s
    when /^created_at_/
      # order("students.created_at #{direction}")
      order(users[:created_at].send(direction))
    when /^name_/
      # order("LOWER(students.last_name) #{direction}, LOWER(students.first_name) #{direction}")
      order(users[:name].lower.send(direction)).order(users[:surname].lower.send(direction))
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  scope :with_created_at_gte, ->(ref_date) {
    where('users.created_at >= ?', ref_date)
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Data di registrazione (nuovi prima)', 'created_at_desc'],
      ['Data di registrazione (vecchi prima)', 'created_at_asc']
    ]
  end

  def full_name
    [name, surname].compact.join(' ')
  end

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end

end 
