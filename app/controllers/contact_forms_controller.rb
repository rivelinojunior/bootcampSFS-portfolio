class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])

    ContactFormMailer.with(
      user: @portfolio.user,
      portfolio: @portfolio,
      email: params[:email],
      title: params[:title],
      description: params[:description]
    ).contact.deliver

    render json: :ok
  end
end
