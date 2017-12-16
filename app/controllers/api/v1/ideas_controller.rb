module Api::V1
  class IdeasController < ApplicationController
    def index
      @ideas = Idea.order("created_at DESC")
      render json: @ideas
    end

    def create
    	@idea = Idea.create(idea_params)
    	render json: @idea
    end

    def update
    	@idea = Idea.find(params[:id])
    	# find idea by id
    	@idea.update_attributes(idea_params)
    	# allow idea to be updated through its strong 
    	# params 
    	render json: @idea
    	# ideas will be rendered in json after being updated.
    end

    def destroy
      @idea = Idea.find(params[:id])
      if @idea.destroy
        head :no_content, status: :ok
      else 
        render json: @idea.errors, status: :unprocessable_entity
      end
    end

    private 
    def idea_params
    	params.require(:idea).permit(:title, :body)
    end
  end
end
