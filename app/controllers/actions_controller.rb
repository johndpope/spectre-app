class ActionsController < ApplicationController
  
  before_filter :signed_in_user, only: [:activity, :create, :transfer,
                                        :pending_close, :confirm_close]

  def activity
    @actions = Action.paginate(page: params[:page])
  end

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
      flash[:success] = "Case transferred."
      CaseFile.find(params[:case_file_id]).update_attributes!(user_id: User.find_by_email(params[:officer]).id)
    else
      flash[:error] = "Transfer failed."
    end
    redirect_to my_cases_path
  end

  def pending_close
    @new_action = current_user.actions.new(
                    type: params[:type],
                    desc: 'requested close confirmation on case ' + params[:case_file_id] + ' from ' + User.find_by_email(params[:officer]).name,
                    content: action_comment(params[:content], "No closing comment provided."),
                    case_file_id: params[:case_file_id])
    if @new_action.save
      flash[:success] = "Case transferred to confirm close."
      CaseFile.find(params[:case_file_id]).update_attributes!(user_id: User.find_by_email(params[:officer]).id, pending_close: true)
    else
      flash[:error] = "Transfer for close confirmation failed."
    end
    redirect_to my_cases_path
  end

  def confirm_close
    @new_action = current_user.actions.new(
                    type: params[:type],
                    desc: 'confirmed close on case ' + params[:case_file_id],
                    content: action_comment(params[:content], "No closing comment provided."),
                    case_file_id: params[:case_file_id])
    if @new_action.save
      flash[:success] = "Case closed and moved to archive."
      CaseFile.find(params[:case_file_id]).update_attributes!(open: false, pending_close: false)
    else
      flash[:error] = "Close confirmation failed."
    end
    redirect_to my_cases_path
  end

  def reject_close
    @new_action = current_user.actions.new(
                    type: params[:type],
                    desc: 'rejected close confirmation on case ' + params[:case_file_id],
                    content: action_comment(params[:content], "No rejection reason provided."),
                    case_file_id: params[:case_file_id])
    if @new_action.save
      flash[:success] = "Case restored to open state."
      CaseFile.find(params[:case_file_id]).update_attributes!(pending_close: false)
    else
      flash[:error] = "Close rejection failed."
    end
    redirect_to my_cases_path    
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
