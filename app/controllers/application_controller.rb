class ApplicationController < ActionController::Base
    protect_from_forgery
    protected

    # login fisrt
    def authenticate_user
        # login failed
        unless session[:user_id]
            redirect_to(:controller => 'sessions', :action => 'login')
            # terminatedly
            return false
        else
         # set current user by the current user object
         # get into session
         @current_user = User.find (session[:user_id])
         # terminatedly
         return true
        end
    end

    # only allow Sign Up && Login Page after logout
    def save_login_state
        # redirect to home Page
        if session[:user_id]
            redirect_to(:controller => 'sessions', :action  => 'home')
            return false
        else
            return true
        end
    end
end