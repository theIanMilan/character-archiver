class SearchesController < ApplicationController
  def index
    @searches = Search.where(searching_for_connections?: true)
    array_of_ids = @searches.pluck(:character_id)
    @characters = Character.where(id: array_of_ids)
  end
end
