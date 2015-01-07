class PostsController < ApplicationController

  load_and_authorize_resource :only => [:destroy]

  def destroy
    post = Post.find(params[:id])
    post.destroy
  	redirect_to root_path
  end

  def create
  end
end
