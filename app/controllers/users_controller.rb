class UsersController < ApplicationController

    def index
      #el controlador esta ligado con la vista
      #app/views/Users
      render 'index'
    end


    def login
        
         if User.exists?(:login=>params[:txtUser],:password=>params[:txtPassword])
            @mensaje= "Usuario correcto"
            @tipo="succes"
	        render 'index'
        else
            @mensaje= "Usuario incorrecto"
            @tipo="error"
            render 'index'
            
        end
    end




end
