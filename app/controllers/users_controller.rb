class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 25)
   
  end

  def show
    @user = User.find(params[:id])
    @pagy, @gameposts = pagy(@user.gameposts.order(id: :desc))
   
  end

  def new
    @user = User.new
    
  end

  def create
     @user = User.new(user_params)
      @user = current_user
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  def signup(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      
      return false
    end
  end
  
  def gamepost_params
    params.require(:gamepost).permit(:title, :developer, :distributor, :platform, :releasedate, :playdate, :registrationdate, :updatedate)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end