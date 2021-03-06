class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    @user_links = Link.where(user_id: find_user).order("created_at desc").page(params[:page]).per(10)
  end

  private

    def find_user
      @user = User.find(params[:id])
    end
end
