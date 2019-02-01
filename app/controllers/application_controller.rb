class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, flash: { error: 'Unauthorized' } }
      format.json { render json: { error: 'Unauthorized' } }
    end
  end
end
