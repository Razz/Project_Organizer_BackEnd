class UsersController < ApplicationController
    include SemanticLogger::Loggable

    def create
      logger.info("Creating user...")
      render json: User.create(user_params);
    end

    def index
      logger.info("Getting all users.")
      render json: User.all
    end

    def update
      user = User.find(params[:id])
      render json: user.update(user_params)
    end

    private

    def user_params
      params.require(:user).permit(:name, :username, :password_digest)
    end
end
