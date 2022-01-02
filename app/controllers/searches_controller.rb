class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search_board]
  before_action :set_character, only: %i[edit update destroy]
  before_action :set_search, only: %i[edit update destroy]
  after_action :verify_authorized, except: :search_board
  include Pagy::Frontend

  def search_board
    sorted_chars = Character.joins(:search).where('searches.searching_for_connections = true').order('searches.updated_at DESC')
    @characters = sorted_chars.includes(%i[user search])
    @pagy, @characters = pagy(@characters, items: 6)
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
    authorize @search
  end

  def search_params
    params.require(:search).permit(:searching_for_connections,
                                   :search_message)
  end
end
