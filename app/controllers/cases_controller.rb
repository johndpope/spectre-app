class CasesController < ApplicationController
  # before_filter :signed_in_user, only: [:index, :show]
  # before_filter :correct_user,   only: [:update]

  def index
    @cases = Case.paginate(page: params[:page])
  end

  # def show
  # end

  # def update
  # end

end
