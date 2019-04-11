class User < ApplicationRecord
  has_many :posts
  has_many :reports
  has_many :sharedposts
  has_many :votes
  has_many :comments


  validates :name , presence: true , format: {with: /\A[a-z]+\z/}
  validates :last_name , presence: true , format: {with: /\A[a-z]+\z/}
  validates :password , presence: true ,length: {in: 9..12}, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "only allows valid email format"}, uniqueness: true
  validates :city, presence: true , format: {with: /\A[a-z]+\z/}
  validates :country, presence: true , format: {with: /\A[a-z]+\z/}

  #function to get user's most popular post
  def Popular
    votes = Vote.where(:positive => true)
    publish = votes.joins(Post)
    users = publish.where(:users => self.id).group_by(:posts).order('COUNT(posts.id) DESC').limit(1)
    users[0].posts
  end

  #get posts where the user commented
end
