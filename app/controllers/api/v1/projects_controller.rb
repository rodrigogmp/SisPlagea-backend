class Api::V1::ProjectsController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!
    before_action :set_project, only:[:show,:update,:link_studant]
    before_action :set_studant, only:[:link_studant]

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

    def link_studant
        @studant.update(project_id: @project.id)
        unless @studant.save
            render json: {errors: @project.errors.full_messages}, status: :bad_request
        else
            render json:{message: "O aluno foi adicionado ao projeto."}, status: :ok

        end
    end

    private

    def params_project
        params.permit(:name,:abstract)
    end

    def set_project
        @project = Project.find(params[:id])
    end

    def set_studant
        @studant = Studant.find(params[:studant_id])
    end

end
