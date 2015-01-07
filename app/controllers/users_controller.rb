class UsersController < ApplicationController

  def index
    @all_users = User.all
  end

  # def show
  #   @user = params[:id]
  # 	@posts = current_user.posts
  # end
  def show
    @user_posts = User.find(params[:id]).posts
    @following = User.find(params[:id]).followeds
    @followers = User.find(params[:id]).followers
    @user = User.find(params[:id])
  end

  def following
    @following_users = User.find(params[:id]).followed_users
  end

  def followers
    @followers = User.find(params[:id]).followers
  end

  def follow(user_id)
    Relationship.create(:follower_id => user_id, :followed_id => current_user.id ).save
  end

  def unfollow(user_id)
    Relationship.destroy(
        Relationship.find_by_sql("select * from relationships
        where follower_id = #{current_user.id} and followed_id = #{user_id}") )
  end

end
