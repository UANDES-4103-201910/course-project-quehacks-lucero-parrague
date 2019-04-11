class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content , presence: true , length: {maximun: 250}
end
