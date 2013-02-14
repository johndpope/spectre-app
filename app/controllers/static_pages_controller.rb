class StaticPagesController < ApplicationController
  def home
    redirect_to activity_path unless !signed_in?
  end

  def about
  end

  def support
  end

  def contact
  end
end
