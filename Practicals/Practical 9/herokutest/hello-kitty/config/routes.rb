Rails.application.routes.draw do

  root 'main#index'

  get 'user/profile'

  get 'user/check_details'

  get 'adoption/kittenlisting'

  get 'adoption/adopt'

  get 'main/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
