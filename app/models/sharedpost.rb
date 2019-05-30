class Sharedpost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #validates is not an owner post
  before_create :AlreadyShared

  def AlreadyShared
    shareds = Sharedpost.where(:user => self.user)
    shareds = shareds.where(:post => self.post).count()
    if shareds > 0
      false
    else
      true
    end
  end
end
