class PoliciesController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def open_gaming_license; end
end
