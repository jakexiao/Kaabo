class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:query]
      sql_query = "username ILIKE :query OR email ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else 
      if current_user.admin
        @users = User.all 
      else
        redirect_to dashboard_path
      end 
    end 
  end 

  def show
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to dashboard_path
      else
        render :new
    end
  end 

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
    redirect_to dashboard_path
    else
      render :edit
    end
  end 

  private

    def user_params
      params.require(:user).permit(:username, :password, :photo, :admin)
    end
end
