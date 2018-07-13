class UsersController < ApplicationController

    def index
      #el controlador esta ligado con la vista
      #app/views/Users
      render 'index'
    end


    def login
        
         if User.exists?(:login=>params[:txtUser],:password=>params[:txtPassword])
           # @mensaje= "Usuario correcto"
           # @tipo="success"
	        render 'home' ,layout:"home"  #redireccionar con layout incluido
        else
            @mensaje= "Usuario incorrecto"
            @tipo="error"
            render 'index'
            
        end
    end

    def getProfiles
        @perfiles=Profile.all
        render "register"
    end    

    def createUser
        mensaje=""
        if !params.presence?(params[:txtLogin]) mensaje+= "Ingrese login" 
        if params[:txtPassword].eql?("")  mensaje+= "Ingrese Password" 
        if params[:txtPerfil].eql?("")  mensaje+= "Ingrese Password" 
        if !params[:txtPassword].eql?(params[:lblPasswordConfirm])  mensaje+= "Password no coinciden"     

            user_search=User.order_by("id").last
            id= user_search.id+1

            user=User.new
            user.login=paramas[:txtLogin]
            user.password=paramas[:txtPassword]
            #user.perfil_id=paramas[:ddlPerfiles]
            user.perfil_id=id

            if user.save?    #se ejecuto el guardar?

            else

            end          
    end

end
