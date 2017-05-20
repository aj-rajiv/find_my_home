class LoginsController < ApplicationController

  def log
  end

  def create

    reg = Registration.find_by_email(params[:email])
  if reg && reg.authenticate(params[:password])
     session[:reg_id] = reg.id
   
    redirect_to '/profile'
  else
   
     redirect_to '/login'
  end
end  

  def destroy
    session[:reg_id] = nil
  redirect_to root_url, :notice => "Logged out!"
  end
  
end
