class ProfilesController < ApplicationController
	  protect_from_forgery with: :exception

 def current_user
  @current_user ||= Registration.find(session[:reg_id]) if session[:reg_id]
end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

	def show
@reg = Registration.find_by id: session[:reg_id]
end

def edit
@reg=Registration.find_by id: session[:reg_id]
end

def update
@reg=Registration.find_by id: session[:reg_id]
if(@reg.update(reg_params))
redirect_to :controller => 'profiles',:action => 'prof'
else
redirect_to :controller => 'profiles',:action => 'edit'
end
end

def destroy
@reg=Registration.find_by id: session[:reg_id]
@reg.destroy
redirect_to '/login'
end

private
  def reg_params
params.require(:reg).permit(:name,:phone,:email,:password,:password_confirmation,:city,:area,:typeofroom,:onebhk,:twobhk,:threebhk)

  end
end
