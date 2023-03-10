class UsersController < ApplicationController

  def all
    @users = User.all
  end

  def steps
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end

    respond_to do |format|
      format.html
      format.json

    end


  end
  
  def feed
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end
   
    people = @user.friend_ids
    theirhabits = Habit.where(owner_id: people)
    habitsid = theirhabits.ids
    @prefeed = Step.where(habit_id: habitsid).order(created_at: "DESC")

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

  def friends
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end

    @friends_sent = @user.accepted_sent_friend_requests
    @friends_received = @user.accepted_received_friend_requests

    respond_to do |format|
      format.html 
      format.json 

    end
  end

  def pending
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end
    @pendings = @user.pending_received_friend_requests

    respond_to do |format|
      format.html 
      format.json 

    end
  end

  def show
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end
  
  end


end 
