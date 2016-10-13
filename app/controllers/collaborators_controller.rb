class CollaboratorsController < ApplicationController

  def create
    #binding.pry
    @collaborator = Collaborator.new(collaborator_params)
    @wiki = Wiki.find_by(params[:collaborator][:wiki_id])

    if @collaborator.save
      flash[:notice] = "Wiki has been saved successfully."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.email} has been removed."
      redirect_to wiki
    else
      flash.now[:alert] = "There as an error removing the collaborator."
      redirect_to wiki
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end
