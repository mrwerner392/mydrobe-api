Rails.application.routes.draw do

  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?

  post "/graphql", to: "graphql#execute"

  resources :users, only: [:create]
  post "/login", to: "login#create"

end
