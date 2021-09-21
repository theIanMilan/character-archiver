class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  def show; end

  def user_characters
    @user = User.find_by(username: params[:username])
    @user_characters = @user.characters
  end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_path(@profile.username), notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: profile_path(@profile.username) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path(@profile.username), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_path(@profile.username) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = User.find_by(username: params[:username]).profile
  end

  def profile_params
    params.require(:profile).permit(:display_name,
                                    :avatar_URL,
                                    :date_of_birth,
                                    :about_me,
                                    :location,
                                    :instagram_username,
                                    :twitter_username,
                                    :discord_username)
  end
end
