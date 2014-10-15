class WikisController < ApplicationController
  before_filter :authenticate_user! , except: [:index, :show]
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    if @wiki.save
      redirect_to @wiki, notice: "Wiki created successfully"
    else
      render 'new'
    end
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])

    if @wiki.update(wiki_params)
      redirect_to @wiki
    else
      render 'edit'
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    @wiki.destroy
      if @wiki.destroy
        redirect_to wikis_path, notice: "Wiki was deleted successfully"
      end
  end
  private

    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end

end
