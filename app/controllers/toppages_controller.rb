class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @gamepost = current_user.gameposts.build  # form_with 用
      @pagy, @gameposts = pagy(current_user.gameposts.order(id: :desc))
    end
  end
end
