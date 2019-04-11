class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #validate content presence true
  validates :description, presence: true, length: {maximum: 250}

end
