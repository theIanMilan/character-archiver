class PhysicalAttributesController < ApplicationController
  before_action :set_character, only: %i[edit update destroy]
  before_action :set_physical_attribute, only: %i[edit update destroy]
  after_action :verify_authorized

  def edit; end

  def update
    if @physical_attribute.update(physical_attribute_params)

      flash.notice = 'Physical Attributes were successfully updated.'
      redirect_to character_path(@character)
    else
      flash.alert = 'Failed: Error in updating Physical Attributes.'
      render 'edit'
    end
  end

  def destroy
    @physical_attribute.destroy
    flash[:notice] = 'Physical Attributes successfully deleted!'
    redirect_to character_path(@character)
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_physical_attribute
    @physical_attribute = PhysicalAttribute.find_or_initialize_by(character_id: @character.id)
    authorize @physical_attribute
  end

  def physical_attribute_params
    params.require(:physical_attribute).permit(:age,
                                               :height,
                                               :weight,
                                               :eyes,
                                               :skin,
                                               :hair)
  end
end
