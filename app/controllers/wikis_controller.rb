class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
    @wikis = policy_scope(Wiki)
    #authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    #authorize @wiki
    @all_collaborators = User.where.not(id: current_user.id)
  end

  def new
    @wiki = Wiki.new
    #authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki has been saved successfully."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki has been successfully saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error saving wiki, please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "#{@wiki.title} was successfully deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
