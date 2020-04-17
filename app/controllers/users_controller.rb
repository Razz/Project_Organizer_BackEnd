class UsersController < ApplicationController

    def create
      render json: user = User.create(user_params);
      puts "User Created user: #{user}"
    end

    def index
      render json: User.all
    end

    def update
      user = User.find(params[:id])
      render json: user.update(user_params)
      puts "User upodated with #{user_params}"
    end

    private

    def user_params
      params.require(:user).permit(:name, :username, :password_digest)
    end
end
