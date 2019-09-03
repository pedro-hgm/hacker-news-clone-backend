class StoriesController < ApplicationController
  before_action :set_stories

  def index
    ids = @stories.ids()
    render_item(ids)
  end

  def show
    story = @stories.show(params[:id])
    render_item(story)
  end

  def comment
    comment = @stories.story_comments(params[:id])
    render_item(comment)
  end

  def search
    ids = @stories.ids(params[:query])
    render_item(ids)
  end

  private

  def set_stories
    @stories = Stories::Story.new
  end

  def render_item(item)
    if item
      render json: item, status: :ok
    else
      render json: { message: "No item could be found" }, status: :not_found
    end
  end
end
