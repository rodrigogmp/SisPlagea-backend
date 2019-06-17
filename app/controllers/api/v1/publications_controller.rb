class Api::V1::PublicationsController < Api::V1::BaseController

  def create
    @publication = Publication.new params_publication

        unless @publication.save
            render json: {errors: @publication.errors.full_messages}, status: :bad_request
        end
  end

  private
    def params_publication
      params.permit(:title,:journal,:category,:year,:volume,:pages,:authors,:file_to_upload)
    end
end
