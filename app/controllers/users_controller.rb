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

    def register
        @perfiles=Profile.all
        render "register"
    end    

    def createUser
        @perfiles=Profile.all
        #Validacion de campos        
        mensaje=""
        if params[:txtLogin].strip.empty? 
            mensaje+= "Ingrese login"  # strip = trim validar vacio
        end    
        if params[:txtPassword].strip.empty? 
             mensaje+= "Ingrese Password" 
        end      
        if params[:dllPerfiles].empty? 
             mensaje+= "Ingrese Password" 
        end      
        if !params[:txtPassword].eql?(params[:lblPasswordConfirm])  
            mensaje+= "Password no coinciden"     
        end     
            if mensaje.eql?("")
                @mensaje=mensaje.slice 0..-2
                return
            end
            #user_search=User.order_by("id").last
            user_search=User.maximum('id')
            id= user_search+1
            puts id
            user=User.new
            user.login=params[:txtLogin]
            user.password=params[:txtPassword]
            user.perfil_id=params[:dllPerfiles]
            user.id=id

            if user.save    #se ejecuto el guardar?
                @mensaje="Se guardo el usuario correctamente"
                @tipo="success"
                render "register"
                #redirect_to action: "register" redireccionar  a una accion
            else
                @mensaje="Ha ocurrido un error al guardar."
                @tipo="error"
                render "register"
            end          
    end
    

end
