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
  resources :documents
  resources :daos

  put '/daos/:id/tags' => 'daos#add_tag_to_dao'
  delete '/daos/:id/tags' => 'daos#remove_tag_from_dao'
  put '/daos/:id/contributors' => 'daos#add_contributor_to_dao'
  delete '/daos/:id/contributors' => 'daos#remove_contributor_from_dao'
end
