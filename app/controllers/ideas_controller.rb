class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def create
    idea = Idea.new(idea_params)

    if idea.save
      #redirect to this page
      redirect_to ideas_path
    else
      flash[:errors] = idea.errors.full_messages
      redirect_to :back
    end
  end
  
  def like

  end

  def show
    @idea = Idea.find(params[:id])
  end
  private
    def idea_params
      params.require(:idea).permit(:idea, :user_id)
    end
end
