class Api::V1::StudantsController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!
    before_action :set_studant, only:[:update,:show]

    def create
        byebug
        @studant = Studant.new params_studant
        studant_id = @studant.id
        Attachment.new(studant_id: studant_id, file_to_upload: params[:file_to_upload])

        unless @studant.save
            render json: {errors: @studant.errors.full_messages}, status: :bad_request
        end
    end

    def show
    end

    def update
        unless @studant.update params_studant
            render json: {errors: @studant.errors.full_messages}, status: :bad_request
        end
    end

    private

    def params_studant
        params.permit(:name,:category,project_attributes:[:name,:abstract,:start_year,:end_year])
    end

    def set_studant
        @studant = Studant.find(params[:id])
    end
    # product_applications_attributes[][name]
end
