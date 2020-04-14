class ProjectCardsController < ApplicationController
    include SemanticLogger::Loggable

    def create
        logger.info("Creating a project with params #{project_card_params}")
        render json: ProjectCard.create(project_card_params);
    end

    def index
        logger.info("Getting all project card")
        render json: ProjectCard.all
    end

    def update
        project_card = ProjectCard.find(params[:id])
        render json: project_card.update(project_card_params)
    end

    def destroy
        project_card = ProjectCard.find(params[:id])
        project_card.delete
    end

    private

    def project_card_params
        params.require(:project_card).permit(:name, :logo, :description, :status, :repo_link, :notes, :user_id, :color)
    end
end
