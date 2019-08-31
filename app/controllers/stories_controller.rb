class StoriesController < ApplicationController
  def initialize
    @stories = Story::Stories.new
  end

  def index
    top_stories = @stories.stories
    render json: top_stories, status: :ok
  end

  def comments
    # comments = Story::Stories.new
    comments = @stories.story_comments(params[:ids])
    render json: comments, status: :ok
  end

  def search
    result = @stories.search_stories(params[:query])
    render json: result, status: :ok
  end
end
