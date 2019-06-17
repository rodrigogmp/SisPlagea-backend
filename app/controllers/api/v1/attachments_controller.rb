class Api::V1::AttachmentsController < Api::V1::BaseController
    # before_action :authenticate_api_v1_user!
    before_action :set_attachment,only:[:show,:destroy]

    def show
    end

    def index
        @attachments = Attachment.all
    end

    def create
        byebug
        @attachment = Attachment.create(params_attachment)
        unless @attachment.save
            render json: {errors: @attachment.errors.full_messages}, status: :bad_request
        end
    end

    def destroy
        if @attachment.destroy
            render json: {message: "Material excluido com sucesso."}, status: :ok
        else
            render json: {error: "Erro ao excluir material."}, status: :bad_request
        end
    end

    private

    def params_attachment
        params.permit(:subject_id, :file_to_upload)
    end

    def set_attachment
        @attachment = Attachment.find(params[:id])
    end
end
