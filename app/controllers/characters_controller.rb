class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_character, only: %i[show edit update destroy]

  def index
    @characters = Character.order('updated_at DESC')
  end

  def show; end

  def new
    @character = current_user.characters.new
    @character.class_and_levels.build
    # For adding fields on the fly, use JS. No built-in Rails support
    # When generating new fields, remember to ensure keys of the associated array
    # is unique - current JS date is a commond choice.
  end

  def edit; end

  def create
    @character = current_user.characters.new(character_params)

    if @character.save
      flash.notice = 'Character was successfully created.'
      redirect_to character_path(@character)
    else
      flash.alert = 'Failed: Error in creating Character.'
      render 'new'
    end
  end

  def update
    if @character.update(character_params)
      flash.notice = 'Character was successfully updated.'
      redirect_to character_path(@character)
    else
      flash.alert = 'Failed: Error in updating Character.'
      render 'edit'
    end
  end

  def destroy
    @character.destroy
    flash[:notice] = 'Task successfully deleted!'
    redirect_to character_path(@character)
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
                                      :private_character,
                                      class_and_levels_attributes: %i[id
                                                                      character_id
                                                                      character_class
                                                                      character_subclass
                                                                      character_level
                                                                      _destroy])
  end
end
