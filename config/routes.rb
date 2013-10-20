Rnoc::Application.routes.draw do
  resources :pages do
    resources :pageboxes

    member do
      get "cycle"
    end
  end

  root :to => "home#index"
end
