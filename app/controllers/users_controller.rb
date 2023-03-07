class UsersController < ApplicationController

  def feed
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end
    @friends = @user.friends
   
    respond_to do |format|
      format.html
      format.json

    end
  end

  def progress
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end
    @habits = @user.own_habits

    respond_to do |format|
      format.html 
      format.json 

    end
  end




end 
