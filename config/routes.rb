MusicApp::Application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resource :user, only: [:create, :new, :show]

#  root to: "user#url"
end
