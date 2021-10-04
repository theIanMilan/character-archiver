class CommentsController < ApplicationController
  before_action :set_profile, only: %i[create destroy]

  def create
    @comment = @profile.comments.build(comment_params)
    @comment[:user_id] = current_user.id
    if @comment.save
      flash.notice = 'Character was successfully created.'
      redirect_to profile_path(@profile.username) and return
    end
    flash.alert = 'Failed: Error in creating Character.'
    redirect_to profile_path(@profile.username)
  end

  def destroy
    @comment = @profile.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment successfully deleted!'
    redirect_to profile_path(@profile.username)
  end

  private

  def set_profile
    @profile = User.find_by(username: params[:profile_username]).profile.decorate
  end

  def comment_params
    params.require(:comment).permit(:user_id,
                                    :profile_id,
                                    :body)
  end
end
