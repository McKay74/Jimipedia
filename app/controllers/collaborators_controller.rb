class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:collaborator][:wiki_id])
    params[:collaborator][:user_ids].each do |g|
    unless g.blank?
      @wiki.users << User.find(g)
    end
    end
    if @wiki.save!
      redirect_to @wiki, notice: "Collaborators added successfully."
    else
      redirect_to @wiki, notice: "Something went wrong. Please try again."
     end
  end
end
