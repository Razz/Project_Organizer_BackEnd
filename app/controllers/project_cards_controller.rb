class ProjectCardsController < ApplicationController

    def create
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        render json: ProjectCard.create(project_card_params);
      end
    end

    def index
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        render json: ProjectCard.all
      end
    end

    def update
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        project_card = ProjectCard.find(params[:id])
        render json: project_card.update(project_card_params)
      end
    end

    def destroy
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        project_card = ProjectCard.find(params[:id])
        project_card.delete
      end
    end

    private

    def project_card_params
        params.require(:project_card).permit(:name, :logo, :description, :status, :repo_link, :notes, :user_id, :color)
    end
end
