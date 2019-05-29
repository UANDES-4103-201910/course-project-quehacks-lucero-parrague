class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :picture
  has_many_attached :files

  validates :title , presence: true , length: {maximum: 250}, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :description , presence: true
  validates :city ,presence: true, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :country, presence: true, format: {with: /\A[a-zA-Z0-9_\-]+\z/}
  validates :gps , presence: true
  #validates :picture, presence: true

  def GetVotes
    votes = Vote.where(:posts => self.id)
    votes.all
  end

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

end
