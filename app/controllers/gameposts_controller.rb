class GamepostsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :correct_user, only: [:destroy, :edit, :update]

  def index
     @pagy, @gameposts = pagy(Gamepost.order(id: :desc), items: 25)
   
  end
  
  def show
    @gamepost = Gamepost.find(params[:id])
  
  end
  
  def new
    @gamepost = Gamepost.new
   
  end
  
  def edit
   @gamepost = Gamepost.find(params[:id])
   
  end
  
  def create
  @user = current_user
     @gamepost = current_user.gameposts.build(gamepost_params)
    if @gamepost.save
      flash[:success] = '投稿しました。'
      redirect_to gameposts_path(@gamepost)
    else
      @pagy, @gameposts = pagy(current_user.gameposts.order(id: :desc))
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  def update
     @gamepost = Gamepost.find(params[:id])
    if @gamepost.update(gamepost_params)
      flash[:success] = '投稿が更新されました'
      redirect_to gameposts_path(@gamepost)
    else
      flash.now[:danger] = '投稿が更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @gamepost.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to @gamepost
  end
  
  private


  def gamepost_params
    params.require(:gamepost).permit(:title, :developer, :distributor, :platform, :releasedate, :playdate, :registrationdate, :updatedate)
  end
  
  def correct_user
    @gamepost = current_user.gameposts.find_by(id: params[:id])
    unless @gamepost
      redirect_to root_url
    end
  end
end
