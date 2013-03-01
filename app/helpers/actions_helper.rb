module ActionsHelper

  def comment_action(params)
    { type: params[:type],
      desc: params[:desc],
      content: params[:content],
      case_file_id: params[:case_file_id] }
  end

  def transfer_action(params)
    { type: params[:type],
      desc: "transferred case #{ params[:case_file_id] } to " +
            "#{ User.find_by_email(params[:officer]).name }",
      content: action_comment(params[:content], "No transfer " +
                                                "comment provided."),
      case_file_id: params[:case_file_id] }
  end

  def pending_close_action(params)
    { type: params[:type],
      desc: "requested close confirmation on case #{ params[:case_file_id] } " +
            "from #{ User.find_by_email(params[:officer]).name }",
      content: action_comment(params[:content], "No closing comment provided."),
      case_file_id: params[:case_file_id] }
  end

  def confirm_close_action(params)
    { type: params[:type],
      desc: 'confirmed close on case ' + params[:case_file_id],
      content: action_comment(params[:content], "No closing comment provided."),
      case_file_id: params[:case_file_id] }
  end

  def reject_close_action(params)
    { type: params[:type],
      desc: 'rejected close confirmation on case ' + params[:case_file_id],
      content: action_comment(params[:content],
                              "No rejection reason provided."),
      case_file_id: params[:case_file_id] }
  end

  def reopen_action(params)
    { type: params[:type],
      desc: 'reopened case ' + params[:case_file_id],
      content: action_comment(params[:content],
                              "No reason for reopening provided."),
      case_file_id: params[:case_file_id] }
  end

  private

    def action_comment(note, default)
      note.empty? ? default : note
    end

end
