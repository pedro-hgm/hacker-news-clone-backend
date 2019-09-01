class StoriesController < ApplicationController
  before_action :set_stories

  def index
    ids = @stories.stories_ids
    render json: ids, status: :ok
  end

  def show
    story = @stories.story(params[:id])
    render json: story, status: :ok
  end

  def comment
    comment = @stories.story_comments(params[:id])
    render json: comment, status: :ok
  end

  def search
    result = @stories.search_stories(params[:query])
    render json: result, status: :ok
  end

  private

  def set_stories
    @stories = Stories::Story.new
  end
end
