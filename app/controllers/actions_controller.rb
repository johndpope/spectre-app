class ActionsController < ApplicationController
  before_filter :signed_in_user, only: [:activity]

  def activity
    @actions = Action.paginate(page: params[:page])
  end
end
