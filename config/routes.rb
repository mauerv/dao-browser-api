Rails.application.routes.draw do
  resources :statuses
  resources :contributors
  resources :contracts
  resources :audits
  resources :auditors
  resources :articles
  resources :podcasts
  resources :tags
  resources :frameworks
  resources :blockchains
  resources :daos
end
