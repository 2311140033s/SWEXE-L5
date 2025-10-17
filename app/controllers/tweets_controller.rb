class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.find_by(id: session[:user_id])
    redirect_to login_path if @user.nil?
  end

  def create
    user = User.find_by(id: session[:user_id])
    if user
      Tweet.create(message: params[:message], user_id: user.id)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    tweet = Tweet.find_by(id: params[:id])
    if tweet && tweet.user_id == session[:user_id]
      tweet.destroy
    end
    redirect_to root_path
  end
end
