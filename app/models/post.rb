class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :sharedposts
  has_many :votes
  has_many :reports
  has_one_attached :picture
  has_many_attached :files

  validates :title , presence: true , length: {maximum: 250}, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :description , presence: true
  validates :city ,presence: true, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :country, presence: true, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :latitude , presence: true
  validates :longitude, presence: true
  #validates :picture, presence: true

  def GetVotes
    votes = Vote.where(:posts => self.id)
    votes.all
  end

  def self.search(search)
    where("title LIKE :query OR description LIKE :query", query: "%#{search}%")
  end

end
