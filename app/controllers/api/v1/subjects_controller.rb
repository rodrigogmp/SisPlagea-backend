class Api::V1::SubjectsController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!
    before_action :set_subject, only:[:upload,:materials,:destroy,:show,:update]

    def create
        @subject = Subject.create(params_subject)
        unless @subject.save
            render json: {errors: @subject.errors.full_messages}, status: :bad_request
        end
    end

    def index
        @subjects = Subject.all
    end

    def materials
        @materials = @subject.attachments
    end

    def destroy
        unless @subject.destroy
            render json: {errors: @subject.errors.full_messages}, status: :bad_request
        else
            render json: {message: "Disciplina excluida com sucesso"}, status: :ok
        end
    end

    def show
    end

    def update
        unless @subject.update params_subject
            render json: {errors: @subject.errors.full_messages}, status: :bad_request
        end
    end

    private

    def params_subject
        params.permit(:name,:category,:code,:workload,:class_location,:description,:summary)
    end

    def params_upload
        params.permit(:file_to_upload)
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end
