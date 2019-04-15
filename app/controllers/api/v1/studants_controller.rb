class Api::V1::StudantsController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!

    def create
        @studant = Studant.new params_studant
        unless @studant.save
            render json: {errors: @studant.errors.full_messages}, status: :bad_request
        end
    end

    private

    def params_studant
        params.permit(:name,:category,:abstract,:start_year,:end_year, :photo)
    end
end
