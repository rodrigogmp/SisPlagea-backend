class Api::V1::ProjectsController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!
    before_action :set_project, only:[:show,:update]

    def index
        @projects = Project.all
    end

    def show
    end

    def create
        @project = Project.new params_project
        unless @project.save
            render json: {errors: @project.errors.full_messages}, status: :bad_request
        end
    end

    def update
        @project.update params_project
        unless @project.save
            render json: {errors: @project.errors.full_messages}, status: :bad_request
        end
    end

    private

    def params_project
        params.permit(:name,:abstract,:start_year,:end_year)
    end

    def set_project
        @project = Project.find(params[:id])
    end

end
