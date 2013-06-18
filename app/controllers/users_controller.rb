class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    respond_to do |format|
      format.html
      format.json { render :json=> UsersDatatable.new(view_context) }
    end
  end

  def systemadmin_dashboard
    @users=User.page(params[:page]).per(25)
    # @userdashboard=User.current_user
    @roles = Role.all

  end

  def update
    @roles = Role.all
    @user = User.find(params[:id])
    @user.role_ids = params[:user_role]
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to dashboard_systemadmin_url
  end
end
