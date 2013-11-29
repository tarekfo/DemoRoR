# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  def authorize
    unless session[:user_id]
      flash[:notice] = "Veuillez vous connecter"
      redirect_to :controller => 'login', :action => 'login'
    end
  end
  
  private
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => :index
  end

end