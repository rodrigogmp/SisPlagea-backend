class Api::V1::StudantsController < ApplicationController
    before_action :authenticate_api_v1_user!

    def create
        @studant = Studant.new params_studant
        unless @studant.save
            render json: {errors: ["Erro ao adicionar estudante."]}, status: :bad_request
        end
    end

    private

    def params_studant
        params.permit(:name,:category,:abstract,:start_year,:end_year, :photo)
    end
end
