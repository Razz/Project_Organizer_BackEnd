require 'opentracing'
class ToDosController < ApplicationController

    def create
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        render json: ToDo.create(to_do_params);
      end
    end
  
    def index
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        render json: ToDo.all
      end
    end

    def update
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        to_do = ToDo.find(params[:id])
        render json: to_do.update(to_do_params)
      end
    end

    def destroy
      OpenTracing.start_active_span(self.class.to_s + '_' + __method__.to_s) do |scope|
        to_do = ToDo.find(params[:id])
        to_do.delete
      end
    end

    private

    def to_do_params
        params.require(:to_do).permit(:description, :completed, :project_card_id, :date, :starttime, :endtime)
    end

end
