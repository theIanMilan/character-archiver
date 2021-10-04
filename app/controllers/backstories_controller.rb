class BackstoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:folklore]
  before_action :set_character, only: %i[edit update destroy]
  before_action :set_backstory, only: %i[edit update destroy]

  def folklore
    array_of_ids = Backstory.all.pluck(:character_id)
    @characters = Character.where(id: array_of_ids).order('updated_at DESC')
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
