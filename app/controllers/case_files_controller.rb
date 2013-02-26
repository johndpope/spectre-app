class CaseFilesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :my_cases]
  before_filter :correct_user,   only: [:update]

  rescue_from ActiveRecord::RecordNotFound, :with => :case_not_found

  def index
    @case_files = CaseFile.where(open: true).paginate(page: params[:page])
    @only_my_cases = false
  end

  def show
    @case_file = CaseFile.find(params[:id])
    @actions = @case_file.actions.paginate(page: params[:page])
    @case_content = JSON.parse(@case_file.content, symbolize_names: true)
    @case_officer = User.find(@case_file.user_id)

    if @case_file.user_id = current_user.id
      @case_action = Action.new
      @officers = User.select("email").where("id != ? AND activated = ?", current_user.id, true)
    end
  end

  def my_cases
    @case_files = CaseFile.where(open: true,
                                 user_id: current_user.id).paginate(page:
                                 params[:page])
    @only_my_cases = true
    render 'index'
  end

  def closed_cases
    @case_files = CaseFile.where(open: false).paginate(page: params[:page])
    @only_my_cases = false
  end

  private

    def case_not_found
      flash[:error] = 'Case not found'
      redirect_to case_files_path
    end
end
