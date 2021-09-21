class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  def index
    @characters = Character.all
  end

  def show; end

  def new
    @character = current_user.characters.new
  end

  def edit; end

  def create
    @character = current_user.characters.new(character_params)

    if @character.save
      flash.notice = 'Character was successfully created.'
      redirect_to my_characters_path(current_user)
    else
      flash.alert = 'Failed: Error in creating Character.'
    end
  end

  def update
    if @character.update(character_params)
      flash.notice = 'Character was successfully updated.'
      redirect_to my_characters_path(current_user)
    else
      flash.alert = 'Failed: Error in updating Character.'
    end
  end

  def destroy
    @character.destroy
    flash[:notice] = 'Task successfully deleted!'
    redirect_to my_characters_path(current_user)
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:character_name,
                                      :character_portrait_URL,
                                      :portrait_credit_artist,
                                      :portrait_credit_URL,
                                      :background,
                                      :alignment,
                                      :race,
                                      :sex,
                                      :gender,
                                      :sexual_orientation,
                                      :private?)
  end
end
