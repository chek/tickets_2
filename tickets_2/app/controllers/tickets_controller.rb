class TicketsController < ApplicationController
  before_action :current_user_customer?, only: [:create]


  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(:subject => params[:subject], :description => params[:description], :customer_id => current_user.id, :status => TicketStatus::NEW)
    @ticket.save
    return render json: {ticket: @ticket}, :status => 200
  end

  private
  def current_user_customer?
    if current_user.blank? or current_user.role != UserRole::CUSTOMER
      return render json: {}, :status => 401
    end
  end
end
