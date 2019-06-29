class Api::V1::PublicationsController < Api::V1::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_publication, only:[:show,:destroy,:update,:create]
  def create
    @publication = Publication.new params_publication

        unless @publication.save
            render json: {errors: @publication.errors.full_messages}, status: :bad_request
        end
  end
  # require 'bibtex'
  def create_from_bibtex
    require 'bibtex'
    @bibtex = Bibtex.new params_create_from_bibtex
    
    unless @bibtex.save
      render json: {errors: "Erro ao fazer upload de arquivo bibtex"}, status: :bad_request
    else
      length = @bibtex.file.path.length
      path = @bibtex.file.path[31,length]
      b = BibTeX.open(`.#{path}`)
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

    def params_create_from_bibtex
      params.permit(:file)
    end
end
