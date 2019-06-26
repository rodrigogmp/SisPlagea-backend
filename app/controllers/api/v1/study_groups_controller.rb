class Api::V1::StudyGroupsController < Api::V1::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_study_group, only:[:participants,:destroy,:show,:link_participant]
  before_action :set_student, only:[:link_participant]

  def create
      @study_group = StudyGroup.create(params_study_group)
      unless @study_group.save
          render json: {errors: @study_group.errors.full_messages}, status: :bad_request
      end
  end

  def index
      @study_groups = StudyGroup.all
  end

  def participants
    @participants = @study_group.group_participants.joins(:student).pluck(:id,:name,:category,:photo,:email)
  end

  def link_participant
    unless @study_group.student_already_subscribed?(@student)
      if @study_group.link_participant(params_link_participant)
        render json: {message: "O aluno foi adicionado com sucesso ao grupo."}, status: 201 #ok
      else
        render json: {error: "Erro ao adicionar aluno."}, status: :bad_request
      end
    else
      render json: {error: "Esse aluno já foi adicionado ao grupo."}, status: :bad_request
    end
  end

  def destroy
      unless @study_group.destroy
          render json: {errors: @study_group.errors.full_messages}, status: :bad_request
      else
          render json: {message: "Grupo excluido com sucesso"}, status: :ok
      end
  end

  def show
  end

  private

  def params_study_group
      params.permit(:name,:create_year,:leaders,:predominant_area,:objective)
  end

  def set_study_group
      @study_group = StudyGroup.find(params[:id])
  end

  def params_link_participant
    params.permit(:student_id, :study_group_id)
  end

  def set_student
    @student = Student.find(params[:student_id])
  end
end
