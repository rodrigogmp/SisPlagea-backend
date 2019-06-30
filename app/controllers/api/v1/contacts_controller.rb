class Api::V1::ContactsController < ApplicationController
  before_action :authenticate_api_v1_user!, except: [:create]
  before_action :set_contact, except: [:create,:index]
  def create
    @contact = Contact.new params_contact
    unless @contact.save
      render json: {errors: @attachment.errors.full_messages}, status: :bad_request
    else
      render json: {message: 'Mensagem enviada com sucesso!'}
    end
  end

  def index
    @contacts = Contact.all
  end

  def show
  end

  def destroy
    unless @contact.destroy
      render json: {errors: @attachment.errors.full_messages}, status: :bad_request
    else
      render json: {message: 'Contato/Mensagem apagado com sucesso!'}
    end
  end

  private
    def params_contact
      params.permit(:email,:subject,:message,:file_to_upload)
    end

    def set_contact
      @contact = Contact.find(params[:id])
    end
end
