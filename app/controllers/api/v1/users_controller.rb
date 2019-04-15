class Api::V1::UsersController < Api::V1::BaseController
    # before_action :authenticate_user!, except: [:reset_password,:create]
    before_action :set_user, only:[:show]
    def create
        @user = User.create sign_up_params
        unless @user.save
            render json: {errors: ["Erro ao adicionar Usuario."]}, status: :bad_request
        end
    end

    def show
    end


    private
        def sign_up_params
            params.permit(:email,:password,:photo,:room,:formation,:phone_number)
        end

        def set_user
            @user = User.find(params[:id])
        end
end