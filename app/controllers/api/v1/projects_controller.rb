class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_project, only:[:show,:update,:link_participant,:update_participant,:participants,:destroy, :unlink_participant]
  before_action :set_student, only:[:link_participant]
  before_action :set_participant, only:[:update_participant, :unlink_participant]

  def index
    @projects = Project.all
  end

  def show
  end

  def create
    @project = Project.new params_project
    unless @project.save
      render json: {errors: @project.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @project.update params_project
    unless @project.save
      render json: {errors: @project.errors.full_messages}, status: :bad_request
    end
  end

  def participants
    @participants = @project.project_participants
  end

  def destroy
    if @project.destroy
      render json: {message: "Projeto excluido com sucesso."}
    end
  end


  def link_participant
    unless @project.student_already_subscribed?(@student)
      if @project.link_participant(params_link_participant)
        render json: {message: "O aluno foi adicionado com sucesso ao projeto."}, status: 201 #ok
      else
        render json: {error: "Erro ao adicionar aluno."}, status: :bad_request
      end
    else
      render json: {error: "Esse aluno já foi adicionado ao projeto."}, status: :bad_request
    end
  end

  def unlink_participant
    byebug
    @participant = ProjectParticipant.find(params[:participant_id])
    unless @participant.destroy
      render json: {error: "Erro ao desvincular aluno do projeto."}, status: :bad_request
    else
      render json: {error: "Aluno desvinculado com sucesso."}, status: :ok
    end
  end

  def update_participant
    @participant.update(params_update_participant)
    unless @participant.save
      render json: {message: "Erro ao atualizar dados do aluno."}, status: :bad_request
    else
    end
  end

  private

  def params_project
    params.permit(:name,:abstract)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_participant
    @participant = ProjectParticipant.find(params[:participant_id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  def params_link_participant
    params.permit(:student_id, :start_year, :end_year, :file_to_upload)
  end

  def params_update_participant
    params.permit(:start_year, :end_year, :file_to_upload)
  end

end
