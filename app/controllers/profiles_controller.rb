class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    if user
      @profile = Profile.new(profile_params)
      @profile.user = user
      if @profile.save
        redirect_to profiles_path
      else
        render :new
      end
    else
      redirect_to login_path
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :age, :location, :bio)
  end
end
