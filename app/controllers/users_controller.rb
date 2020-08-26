class UsersController < ApplicationController

    def new 
       user = User.new 
    end 

    def create

        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to "/login"
        else 
            redirect_to "/signup"
        end 
    end

    def show 
        @user = current_user 
        if @user 
            render :home
        else 
            redirect_to "/login"
        end 
    end 
     
      private
     
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end 