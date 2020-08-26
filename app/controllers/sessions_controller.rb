class SessionsController < ApplicationController

 def new 

 end 
    
 def create
  @user = User.find_by(name: params[:user][:name])
   if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      
   else 
      redirect_to "/login"
   end 
 end

 def destroy
  if current_user 
    session.delete :name
  end 
 end 
end 