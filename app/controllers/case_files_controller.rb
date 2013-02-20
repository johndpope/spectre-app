class CaseFilesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :my_cases]
  before_filter :correct_user,   only: [:update]

  def index
    @case_files = CaseFile.where(open: true).paginate(page: params[:page])
    @only_my_cases = false
  end

  # def show
  # end

  # def update
  # end

  def my_cases
    @case_files = CaseFile.where(open: true,
                                 user_id: current_user.id).paginate(page:
                                 params[:page])
    @only_my_cases = true
    render 'index'
  end

end
