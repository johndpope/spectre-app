class StaticPagesController < ApplicationController
  def home
  end

  def activity
    @static_pages = Action.paginate(page: params[:page])
  end

  def about
  end

  def support
  end

  def contact
  end
end
