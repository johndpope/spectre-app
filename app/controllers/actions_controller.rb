class ActionsController < ApplicationController
  
  before_filter :signed_in_user, only: [:activity, :create, :transfer]

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

  def transfer
    @new_action = current_user.actions.new(
                    type: params[:type],
                    desc: 'transferred case ' + params[:case_file_id] + ' to ' + User.find_by_email(params[:officer]).name,
                    content: action_comment(params[:content], "No transfer comment provided."),
                    case_file_id: params[:case_file_id])
    if @new_action.save
      flash[:notice] = "Case transferred."
      CaseFile.find(params[:case_file_id]).update_attributes!(user_id: User.find_by_email(params[:officer]).id)
    else
      flash[:error] = "Transfer failed."
      redirect_to root_url
    end
    redirect_to my_cases_path
  end

  def activity
    @actions = Action.paginate(page: params[:page])
  end

  private

    def action_comment(note, default)
      if note.empty?
        default
      else
        note
      end
    end

end
