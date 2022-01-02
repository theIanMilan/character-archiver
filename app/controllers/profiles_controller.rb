class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show user_characters]
  before_action :set_profile, only: %i[show edit update]
  after_action :verify_authorized, except: :user_characters

  def show
    @comments = @profile.comments.includes(:user)
  end

  def user_characters
    @user = User.find_by(username: params[:username])
    @user_characters = @user.characters.order('updated_at DESC')
    @pagy, @user_characters = pagy(@user_characters, items: 10)
  end

  def edit; end

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
    @profile = User.find_by(username: params[:username]).profile.decorate
    authorize @profile
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
