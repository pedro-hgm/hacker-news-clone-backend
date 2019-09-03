class StoriesController < ApplicationController
  before_action :set_story
  before_action :set_comment, only: [:comment]

  def index
    ids = @story.ids()
    render_item(ids)
  end

  def show
    story = @story.show(params[:id])
    render_item(story)
  end

  def comment
    comment = @comment.show(params[:id])
    render_item(comment)
  end

  def search
    ids = @story.ids(params[:query])
    render_item(ids)
  end

  private

  def set_story
    @story = Stories::Story.new
  end

  def set_comment
    @comment = Stories::Comment.new
  end

  def render_item(item)
    if item
      render json: item, status: :ok
    else
      render json: { message: "No item could be found" }, status: :not_found
    end
  end
end
