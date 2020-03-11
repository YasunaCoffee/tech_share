class UsersController < ApplicationController
  def index
    @users_odd = []
    @users_even = []
    User.all.each do |user|
      @users_odd << user if user.id.odd?
      @users_even << user if user.id.even?
    end
  end

  def show
    @user = User.includes(:articles).find(params[:id])
  end
end
