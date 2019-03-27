class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def leaderboard
    @leaderboard = User.leaderboard
    render json: @leaderboard
  end


  def update
    @user = User.find(params[:user][:id])
    @score = params[:score].reduce(&:+)
    @game = Game.create(user: @user, score: @score);
    @user.games << @game;
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :score, :userId)
  end

end
