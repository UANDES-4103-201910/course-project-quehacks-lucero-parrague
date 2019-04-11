class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  before_save :votedAgain

  def votedAgain
    votes = Vote.where(post => self.post)
    users = votes.where(user => self.user)
    cnt = users.count()
    if cnt == 1
      if users[0].positive == self.positive
        false
      else
        users[0].delete
        true
      end
    end
  end

end
