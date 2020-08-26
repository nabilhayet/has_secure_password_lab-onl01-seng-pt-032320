class SessionsController < ApplicationController

 def new 

 end 
    
 def create
  @user = User.find_by(name: params[:user][:name])
   if !@user.authenticate(params[:user][:password])

      redirect_to "/login"
   else 
      session[:user_id] = @user.id
   end 
 end

 def destroy
  if current_user 
    session.delete :name
  end 
 end 
end 