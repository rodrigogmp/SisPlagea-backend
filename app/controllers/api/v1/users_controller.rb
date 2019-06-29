class Api::V1::UsersController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!, except: [:recover_password,:create]
    before_action :set_user, only:[:show]
    def create
        @user = User.create sign_up_params
        unless @user.save
            render json: {errors: @user.errors.full_messages}, status: :bad_request
        end
    end

    def show
    end

    def recover_password
        @user = User.find_by(email: params[:email])
        @password = (0...8).map { (65 + rand(26)).chr }.join
        @user.update!(password: @password)
        UserMailer.recover_password(@user.email, @password).deliver_later
        render json: {message: 'Uma nova senha foi enviada para o seu email.'}
    end

    def update
        byebug
        @user = current_api_v1_user
        @user.update params_update
        unless @user.save
            render json: {errors: "Erro ao atualizar perfil"}
        end
    end

    def change_password
        @user = current_api_v1_user
        @user.update!(password: params[:new_password])
        render json: {message: "Senha atualizada com sucesso!"}
    end

    private
        def sign_up_params
            params.permit(:email,:password,:photo,:room,:formation,:phone_number)
        end

        def set_user
            @user = User.find(params[:id])
        end

        def params_recover_password
            params.permit(:email).require(:email)
        end

        def params_change_password
            params.require(:new_password).permit(:new_password)
        end

        def params_update
            params.permit(:photo,:room,:formation,:phone_number)
        end
end