class IncidentMonitorsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show]

  rescue_from ActiveRecord::RecordNotFound, :with => :monitor_not_found

  def index
    @incident_monitors = IncidentMonitor.all(:order => 'active DESC, type')
  end

  def show
    @incident_monitor = IncidentMonitor.find(params[:id])
  end

  private

    def monitor_not_found
      flash[:error] = 'Incident monitor not found'
      redirect_to incident_monitors_path
    end

end
