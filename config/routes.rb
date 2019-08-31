Rails.application.routes.draw do
  get "stories/index"
  post "stories/comments"
  post "stories/search"
end
