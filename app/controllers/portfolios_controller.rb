class PortfoliosController < ApplicationController
  before_action :load_portfolios, only: :index

  def index
    authorize(Portfolio)
  end

  def create
    @portfolio = current_user.portfolios.create
    redirect_to edit_portfolio_path(@portfolio)
  end

  def edit
    @portfolio = policy_scope(Portfolio).find(params[:id])
    authorize @portfolio
  end

  private

  def load_portfolios
    @portfolios = policy_scope(Portfolio)
  end
end
