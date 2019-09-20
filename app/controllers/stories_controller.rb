class StoriesController < ApplicationController
  def index
    ids = ApiManager::FetchTopStoriesIds.execute()
    render_item(ids)
  end

  def show
    story = StoriesManager::StoryCreator.execute(id: params[:id])
    render_item(story)
  end

  def comment
    comment = StoriesManager::CommentCreator.execute(id: params[:id])
    render_item(comment)
  end

  def search
    ids = ApiManager::FetchLatestStoriesIds.execute(query: params[:query])
    render_item(ids)
  end

  private

  def render_item(item)
    if item
      render json: item, status: :ok
    else
      render json: { message: "No item could be found" }, status: :not_found
    end
  end
end
