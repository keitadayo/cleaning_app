class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
      Good.create(good_params)
  end

  def destroy
    @good = Good.find_by(post_id: params[:post_id], user_id: current_user.id)
    @good.destroy
  end

  private
  def good_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end
end
