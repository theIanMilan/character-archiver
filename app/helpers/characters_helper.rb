module CharactersHelper
  def setup_character(character)
    # Views _form helper for nested attributes
    character.search ||= Search.new
    character
  end
end
