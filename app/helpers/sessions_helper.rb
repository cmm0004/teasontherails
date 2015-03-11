module SessionsHelper
    
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def get_current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif(user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in(user)
                @current_user = user
            end
        end
    end
    
    def logged_in?
        !get_current_user.nil?
    end
    
    # Remembers a user in a persistent session.
    def remember(user)
        user.set_remember_token
        cookies.permanent.signed[:user_id] = user.id
        #user.remember_token is the User::remember_token class variable, 
        #no getters on the rails train...
        cookies.permanent[:remember_token] = user.remember_token
        
    end
    
    def forget(user)
        user.delete_remember_digest
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
        
end
