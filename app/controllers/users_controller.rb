class UsersController < ApplicationController
  before_filter :authenticate_user!
  def wikis
    @wikis = current_user.wikis
  end
end
