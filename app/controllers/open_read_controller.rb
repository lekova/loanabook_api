class OpenReadController < ApplicationController
  include ActionController::HttpAuthentication::Token

  skip_before_action :authenticate, only: [:index, :show]
  before_action :set_current_user, only: [:index, :show]

  private
  def set_current_user
    return if @current_user
    token = token_and_options(request)
    @current_user = User.find_by(token: token) if token
  end

end
