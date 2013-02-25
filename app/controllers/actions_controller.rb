class ActionsController < ApplicationController
  
  before_filter :signed_in_user, only: [:activity]

  def create
    session[:return_to] = request.referer
    @new_action = current_user.actions.new(
                    type: params[:type],
                    desc: params[:desc],
                    content: params[:content],
                    case_file_id: params[:case_file_id])
    if @new_action.save
      redirect_to case_file_path(CaseFile.find(params[:case_file_id]))
    else
      # flash[:error] = "No blank comments allowed."
      redirect_to session[:return_to]
    end
  end

  def activity
    @actions = Action.paginate(page: params[:page])
  end
end
