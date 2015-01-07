class User < ActiveRecord::Base
	has_many :posts , :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :relationships, :foreign_key => :follower_id , :dependent => :destroy
  has_many :followeds, :through => :relationships

  has_many :reverse_relationships, :class_name => Relationship, :foreign_key => :followed_id, :dependent => :destroy
  has_many :followers, :through => :reverse_relationships

  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by_followed_id(other_user.id).destroy
  end

end
