require 'opentracing'
class UsersController < ApplicationController
    include SemanticLogger::Loggable

    def create
      logger.info("Creating user...")
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
      render json: User.create(user_params);
    end
  end

    def index
      logger.info("Getting all users.")
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
      render json: User.all
    end
  end

  def update
    OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
      user = User.find(params[:id])
      render json: user.update(user_params)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password_digest)
  end
end
