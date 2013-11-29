class LoginController < ApplicationController
  layout "admin"
  def index
    @total_orders = Order.count
    @pending_orders = Order.count_pending
  end
  
  def add_user
    if request.get?
      @user = User.new
    else
      @user = User.new(params[:user])
      if @user.save
        redirect_to_index("User #{@user.name} created")
      end
    end
  end

  def login
    if request.get?
      session[:user_id] = nil
      @user = User.new
    else
      @user = User.new(params[:user])
      logged_in_user = @user.try_to_login
      if logged_in_user
        session[:user_id] = logged_in_user.id
        flash[:notice] = nil
        redirect_to :action => 'index'
      else
        flash[:notice] = "Nom d'utilisateur ou mot de passe incorrect"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Déconnecté"
    redirect_to :action => 'login'
  end

  def delete_user
    id = params[:id]
    if id && user = User.find(id)
      begin
        user.destroy
        flash[:notice] = "Utilisateur #{user.name} supprimé"
      rescue
        flash[:notice] = "Impossible de supprimer cet utilisateur"
      end
    end
    redirect_to :action => :list_users
  end
  def list_users
    @all_users = User.find(:all)
  end
end
