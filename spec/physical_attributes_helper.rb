module PhysicalAttributesHelper
  def create_character_physical_attributes(character, hair)
    visit edit_character_physical_attributes_path(character)
    fill_in 'Age', with: '100'
    fill_in 'Height', with: '180cm'
    fill_in 'Weight', with: '200lbs'
    fill_in 'Eyes', with: 'Black'
    fill_in 'Skin', with: 'Pale'
    fill_in 'Hair', with: hair
    click_on 'Create Physical attribute'
  end

  def update_character_physical_attributes(character, hair)
    visit edit_character_physical_attributes_path(character)
    fill_in 'Age', with: '10'
    fill_in 'Height', with: '18cm'
    fill_in 'Weight', with: '20lbs'
    fill_in 'Eyes', with: 'Red'
    fill_in 'Skin', with: 'Ghostly'
    fill_in 'Hair', with: hair
    click_on 'Update Physical attribute'
  end
end
