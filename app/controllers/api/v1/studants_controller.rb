class Api::V1::StudantsController < Api::V1::BaseController
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_api_v1_user!
    before_action :set_studant, only:[:update,:show]

    def create
        @studant = Studant.new params_studant

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
        params.permit(:name,:category,:photo,project_attributes:[:name,:abstract,:start_year,:end_year])
    end

    def params_attachment
        params.permit(:photo)
    end

    def set_studant
        @studant = Studant.find(params[:id])
    end
end
