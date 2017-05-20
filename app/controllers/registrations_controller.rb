class RegistrationsController < ApplicationController


	def create
    @reg = Registration.new(reg_params)
    if @reg.save
    session[:reg_id] = @reg.id
    redirect_to '/login'
  else
    redirect_to '/reg'
 
  end
	end



  def index
     @areas = Registration.find_by_sql("SELECT area FROM registrations GROUP BY area").map &:area
    @reg = params[:area].blank? ? Registration.all : Registration.where(area: params[:area])
   
  end
  
   
 

  private
  def reg_params
params.require(:reg).permit(:name,:phone,:email,:password,:password_confirmation,:city,:area,:typeofroom,:onebhk,:twobhk,:threebhk)
  end
end
