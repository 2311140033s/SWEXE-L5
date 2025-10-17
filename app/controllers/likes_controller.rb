class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(id: session[:user_id])
    user.like_tweets << tweet
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(id: session[:user_id])
    like = tweet.likes.find_by(user_id: user.id)
    like.destroy if like
    redirect_to root_path
  end
end
