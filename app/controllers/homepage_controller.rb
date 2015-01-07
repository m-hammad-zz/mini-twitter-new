class HomepageController < ApplicationController

  def home
    @posts = Post.all
    # @followed_users = current_user.followed_users
    # @followers = current_user.followers
    # @feed = current_user.feed
  end

  def create
    my_post =  params['post_form_for']['my_new_post']
    @new_post=current_user.posts.create(:content=>my_post)
    redirect_to(homepage_home_path,notice:"new post has been created successfully")
  end

end
