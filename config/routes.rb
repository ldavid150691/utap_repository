Rails.application.routes.draw do
  resources :profiles# agrego por defecto del scaffold
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "users" => "users#index" #Alias de naveacion de pagina web(controlador/accion (Metodo)) localhost:3000/users
  post "users/login"# Peticiones POST submit matricular controlador/accion

  post "users/createUser"
  get  "users/register"

  post "users/index"



end
