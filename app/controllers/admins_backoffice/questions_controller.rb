class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :get_subjects, only: [:edit, :new]
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    @questions = Question.includes(:subject).order(:description).page(params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params_question)
    if @question.save()
    redirect_to admins_backoffice_questions_path,
    notice: "Questão cadastrada com sucesso!"
    else
    render :new
    end
  end

  def edit
    
  end

  def update

    if @question.update(params_question)
      redirect_to admins_backoffice_questions_path,
      notice:"Questão atualizada com Sucesso!"
    else
      render :edit
    end
  end

  def destroy

    if @question.destroy
      redirect_to admins_backoffice_questions_path,
      notice:"Questão escluída com Sucesso!"
    else
      render :index
    end
  end

  private

  def params_question
    params.require(:question).permit(:description, :subject_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def get_subjects
    @subject = Subject.all
  end
end
