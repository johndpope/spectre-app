class ActionsController < ApplicationController
  include ActionsHelper
  
  before_filter :signed_in_user, only: [:activity, :create, :transfer,
                                        :pending_close, :confirm_close,
                                        :reject_close, :reopen]

  # Equivalent to the index action.
  def activity
    @actions = Action.paginate(page: params[:page])
  end

  # 
  # The following actions are triggered by the user administering a case file.
  # 
  def comment
    session[:return_to] = request.referer
    @new_action = current_user.actions.new(comment_action(params))
    if @new_action.save
      redirect_to case_file_path(CaseFile.find(params[:case_file_id]))
    else
      redirect_to session[:return_to]
    end
  end

  def transfer
    @new_action = current_user.actions.new(transfer_action(params))
    if @new_action.save
      flash[:success] = 'Case transferred.'
      CaseFile.find(params[:case_file_id]).update_attributes!(
        user_id: User.find_by_email(params[:officer]).id)
    else
      flash[:error] = 'Transfer failed.'
    end
    redirect_to my_cases_path
  end

  def request_close
    @new_action = current_user.actions.new(request_close_action(params))
    if @new_action.save
      flash[:success] = 'Case transferred to confirm close.'
      CaseFile.find(params[:case_file_id]).update_attributes!(
        user_id: User.find_by_email(params[:officer]).id, pending_close: true)
    else
      flash[:error] = 'Transfer for close confirmation failed.'
    end
    redirect_to my_cases_path
  end

  def confirm_close
    @new_action = current_user.actions.new(confirm_close_action(params))
    if @new_action.save
      flash[:success] = 'Case closed and moved to archive.'
      CaseFile.find(params[:case_file_id]).update_attributes!(
        open: false, pending_close: false)
    else
      flash[:error] = 'Close confirmation failed.'
    end
    redirect_to my_cases_path
  end

  def reject_close
    @new_action = current_user.actions.new(reject_close_action(params))
    if @new_action.save
      flash[:success] = 'Case restored to open state.'
      CaseFile.find(params[:case_file_id]).update_attributes!(
        pending_close: false)
    else
      flash[:error] = 'Close rejection failed.'
    end
    redirect_to my_cases_path
  end

  def reopen
    @new_action = current_user.actions.new(reopen_action(params))
    if @new_action.save
      flash[:success] = 'Case reopened and assigned to you.'
      CaseFile.find(params[:case_file_id]).update_attributes!(
        open: true, user_id: current_user.id)
    else
      flash[:error] = 'Reopen attempt failed.'
    end
    redirect_to my_cases_path    
  end
end
