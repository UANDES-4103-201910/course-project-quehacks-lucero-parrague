class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts
  has_many :reports
  has_many :sharedposts
  has_many :votes
  has_many :comments


  validates :name , presence: true , format: {with: /\A[A-Za-z]+\z/}
  validates :last_name , presence: true , format: {with: /\A[A-Za-z]+\z/}
  validates :password , presence: true ,length: {in: 9..12}, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "only allows valid email format"}, uniqueness: true
  validates :city, presence: true , format: {with: /\A[A-Za-z]+\z/}
  validates :country, presence: true , format: {with: /\A[A-Za-z]+\z/}

  #function to get user's most popular post
  def Popular
    votes = Vote.where(:positive => true)
    publish = votes.joins(Post)
    users = publish.where(:users => self.id).group_by(:posts).order('COUNT(posts.id) DESC').limit(1)
    users[0].posts
  end

  def self.search(search)
    User.where("email LIKE :query OR country LIKE :query OR city LIKE :query", query: "%#{search}%")
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  #get posts where the user commented
end
