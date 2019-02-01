class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :user_logged_in?

  def home; end

  private

  def user_logged_in?
    redirect_to portfolios_path if current_user
  end
end
