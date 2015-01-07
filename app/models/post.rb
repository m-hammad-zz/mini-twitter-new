class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :user_id

  validates :user_id , :presence => true
  validates :content, :allow_blank => false, :presence=> true

  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end

end
