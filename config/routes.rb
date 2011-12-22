Jshq::Application.routes.draw do
  devise_for :users

  api_version(1) do
    resources :packages do
      collection do
        get "search" => "packages#search"
      end

      member do
        get "download" => "packages#download", :as => "download"
      end
    end
  end

  resources :packages do
    collection do
      get "search" => "packages#search", :as => "search"
    end

    member do
      get "download" => "packages#download", :as => "download"
    end
  end

  root :to => "site#index"
end
