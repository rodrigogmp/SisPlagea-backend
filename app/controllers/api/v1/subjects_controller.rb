class Api::V1::SubjectsController < Api::V1::BaseController
    before_action :authenticate_api_v1_user!

    def create
        @subject = Subject.create(params_subject)
        unless @subject.save
            render json: {errors: @subject.errors.full_messages}, status: :bad_request
        end
    end

    def index
        @subjects = Subject.all
    end

    private

    def params_subject
        params.permit(:name,:category)
    end
end
