class Api::V1::PublicationsController < Api::V1::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_publication, only:[:show,:destroy,:update]
  def create
    @publication = Publication.new params_publication

        unless @publication.save
            render json: {errors: @publication.errors.full_messages}, status: :bad_request
        end
  end

  def index
    @publications = Publication.all
  end

  def show
  end

  def destroy
    unless @publication.destroy
        render json: {errors: @publication.errors.full_messages}, status: :bad_request
    else
        render json: {message: "Publicação excluida com sucesso"}, status: :ok
    end
  end

  def update
    unless @publication.update params_publication
      render json: {errors: @publication.errors.full_messages}, status: :bad_request
    end
  end

  private
    def params_publication
      params.permit(:title,:journal,:category,:year,:volume,:pages,:authors,:file_to_upload)
    end

    def set_publication
      @publication = Publication.find(params[:id])
    end
end
