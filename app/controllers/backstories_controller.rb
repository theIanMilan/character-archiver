class BackstoriesController < ApplicationController
  before_action :set_character, only: %i[edit update destroy]
  before_action :set_backstory, only: %i[edit update destroy]

  def index
    array_of_ids = Backstory.all
    @characters = Character.where(id: array_of_ids)
  end

  def edit; end

  def update
    if @backstory.update(search_params)

      flash.notice = 'Backstory details were successfully updated.'
      redirect_to character_path(@character)
    else
      flash.alert = 'Failed: Error in updating Backstory details.'
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
  end

  def search_params
    params.require(:backstory).permit(:body,
                                      :personality,
                                      :ideals,
                                      :bonds,
                                      :flaws)
  end
end
