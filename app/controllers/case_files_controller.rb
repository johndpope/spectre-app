class CaseFilesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :my_cases, :closed_cases]
  before_filter :verify_ip, only: [:create]

  rescue_from ActiveRecord::RecordNotFound, :with => :case_not_found

  # This should be called only by the incident listener app.
  def create
    user = User.find_by_email('nitin@spectredemo.com')
    incident = params['incident']
    new_case = user.case_files.new(
                 type: incident['type'],
                 name: incident['name'],
                 content: incident['events'].to_json,
                 detection_time: incident['detection-time'],
                 participants: incident['participants'],
                 symbol: incident['symbol'])
    new_case.save
    
    new_action = user.actions.new(
      type: 'Generate',
      desc: "Spectre generated case #{ new_case.id } and assigned it to " +
            "#{ user.name }",
      content: 'Generate action',
      case_file_id: new_case.id)
    new_action.save
    UserMailer.case_generated(user, new_case).deliver

    render nothing: true, status: :ok
  end

  def index
    @case_files = CaseFile.where(open: true).paginate(page: params[:page])
    @only_my_cases = false
  end

  def show
    @case_file = CaseFile.find(params[:id])
    @actions = @case_file.actions.paginate(page: params[:page])
    @case_content = JSON.parse(@case_file.content)
    @case_officer = User.find(@case_file.user_id)

    # If the user is viewing his own case.
    if @case_file.user_id = current_user.id
      @case_action = Action.new
      @officers = User.select('email').where('id != ? AND activated = ?',
                                             current_user.id, true)
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

    def verify_ip
      @ips = ['10.35.10.116']
      if not @ips.include? request.remote_ip
        redirect_to root_url
      end
    end

end
