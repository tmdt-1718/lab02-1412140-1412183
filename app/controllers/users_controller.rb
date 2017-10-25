class UsersController < ApplicationController

  
  # run this firstly
  before_action :save_login_state, :only => [:new, :create]
  
    def stranger
      @stranger = User.all_except(@current_user)
    end
    def new
        @user = User.new     
    end
  
     def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] = "You Signed up successfully"
          flash[:color]= "valid"
        else
          flash[:notice] = "Form is invalid"
          flash[:color]= "invalid"
        end
        render "new"
      end
      
      private

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end

      def friend_list
      end
  
  
end
