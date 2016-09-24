class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @wikis = @user.wikis
  end
end
