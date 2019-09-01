Rails.application.routes.draw do
  get "stories/index"
  get "stories/comment/:id", to: "stories#comment"
  post "stories/search"
  get "stories/show/:id", to: "stories#show"
end
