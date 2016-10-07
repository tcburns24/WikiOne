class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @wikis = @user.wikis
  end

  def downgrade
    @user = current_user
    @user.downgrade
    @user.wikis.each { |wiki| wiki.downgrade }
    flash[:notice] = "You are no longer a Premium WikiOne-er"
    redirect_to profile_path
  end
end
