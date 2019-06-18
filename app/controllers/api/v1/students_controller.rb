class Api::V1::StudentsController < Api::V1::BaseController
    # include DeviseTokenAuth::Concerns::SetUserByToken
    # before_action :authenticate_api_v1_user!
    before_action :set_student, only:[:update,:show,:destroy]

    def create
        @student = Student.new params_student

        unless @student.save
            render json: {errors: @student.errors.full_messages}, status: :bad_request
        end
    end

    def show
    end

    def index
        @students = Student.all
    end

    def update
        unless @student.update params_student
            render json: {errors: @student.errors.full_messages}, status: :bad_request
        end
    end

    def destroy
        unless @student.destroy
            render json: {errors: @student.errors.full_messages}, status: :bad_request
        else
            render json: {message: "Estudante excluido com sucesso"}, status: :ok
        end
    end

    

    private

    def params_student
        params.permit(:name,:category,:photo,:email, :registration, :lattes_link, :relevant_informations)
    end

    def set_student
        @student = Student.find(params[:id])
    end
end


