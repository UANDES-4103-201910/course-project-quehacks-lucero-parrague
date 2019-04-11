class Sharedpost < ApplicationRecord
  belongs_to :user
  belongs_to :posts

  #validates is not an owner post
  before_create :AlreadyShared

  def AlreadyShared
    shareds = Sharedpost.where(:users => self.users)
    shareds = shareds.where(:posts => self.posts).count()
    if shareds > 0
      false
    else
      true
    end
  end
end
