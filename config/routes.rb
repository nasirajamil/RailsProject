Rails.application.routes.draw do

  get 'welcome/index', to: redirect('/articles/%{name}')
  get '/articles?num=100' => 'articles#index'
  get '/articles/non_Commented_Book' => 'articles#non_Commented_Book', as: :empty, v: 'myvar'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
   resources :articles, path_names: { new: 'make', edit: 'change' } do
     resources :comments
   end

  root 'welcome#index'
end
