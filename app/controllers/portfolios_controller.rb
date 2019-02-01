class PortfoliosController < ApplicationController
  before_action :load_portfolios, only: :index

  def index
    authorize(Portfolio)
  end

  private

  def load_portfolios
    @portfolios = policy_scope(Portfolio)
  end
end
