class CaseFilesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show]
  before_filter :correct_user,   only: [:update]

  def index
    @case_files = CaseFile.paginate(page: params[:page])
  end

  # def show
  # end

  # def update
  # end

end
