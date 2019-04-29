class Api::V1::SubjectsController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!
    before_action :set_subject, only:[:upload]

    def create
        @subject = Subject.create(params_subject)
        unless @subject.save
            render json: {errors: @subject.errors.full_messages}, status: :bad_request
        end
    end

    def index
        @subjects = Subject.all
    end

    def upload
        if @subject.upload(params_upload)
            render json: {message: "Arquivo adicionado com sucesso."}, status: 201
        else
            render json: {error: "Erro ao adicionar arquivo."}, status: :bad_request
        end
    end

    private

    def params_subject
        params.permit(:name,:category)
    end

    def params_upload
        params.permit(:file_to_upload)
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end
