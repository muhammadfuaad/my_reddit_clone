class PublicController < ApplicationController
  def index
    @communities = Community.all.limit(10)
    @posts = Post.order(id: :desc).limit(20)
  end

  def profile
    @profile = Account.find_by_username params[:username]
    # Q8: where the username is coming from?
    @posts = @profile.posts
  end
end