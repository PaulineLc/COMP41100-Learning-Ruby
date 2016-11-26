Rails.application.routes.draw do
  get 'user/profile'

  get 'adoption/kittenlisting'

  get 'adoption/adopt/:cat' => 'adoption#adopt'

  get 'main/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
