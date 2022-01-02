class BackstoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:folklore]
  before_action :set_character, only: %i[edit update destroy]
  before_action :set_backstory, only: %i[edit update destroy]
  after_action :verify_authorized, except: :folklore
  include BackstoriesHelper

  def folklore
    sorted_chars = Character.joins(:backstory).merge(Backstory.order(updated_at: :desc))
    @characters = sorted_chars.includes(%i[user backstory])
    @pagy, @characters = pagy(@characters, items: 5)
  end

  def edit; end

  def update
    if @backstory.update(search_params)

      flash.notice = 'Backstory details were successfully updated.'
      redirect_to character_path(@character)
    else
      flash.alert = 'Failed: Error in updating Backstory details.'
      render 'edit'
    end
  end

  def destroy
    @backstory.destroy
    flash[:notice] = 'Backstory details has been successfully deleted!'
    redirect_to character_path(@character)
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_backstory
    @backstory = Backstory.find_or_initialize_by(character_id: @character.id)
    authorize @backstory
  end

  def search_params
    params.require(:backstory).permit(:intro,
                                      :quote_body,
                                      :quote_author,
                                      :appearance,
                                      :personality,
                                      :ideals,
                                      :bonds,
                                      :flaws,
                                      :biography)
  end
end
