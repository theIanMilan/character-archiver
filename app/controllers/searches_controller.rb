class SearchesController < ApplicationController
  before_action :set_character, only: %i[edit update destroy]
  before_action :set_search, only: %i[edit update destroy]

  def search_board
    @searches = Search.where(searching_for_connections: true)
    array_of_ids = @searches.pluck(:character_id)
    @characters = Character.where(id: array_of_ids).order('updated_at DESC')
  end

  def edit; end

  def update
    if @search.update(search_params)

      flash.notice = 'Search details were successfully updated.'
      redirect_to character_path(@character)
    else
      flash.alert = 'Failed: Error in updating Search details.'
      render 'edit'
    end
  end

  def destroy
    @search.destroy
    flash[:notice] = 'Search details has been successfully deleted!'
    redirect_to character_path(@character)
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_search
    @search = Search.find_or_initialize_by(character_id: @character.id)
  end

  def search_params
    params.require(:search).permit(:searching_for_connections,
                                   :search_message)
  end
end
