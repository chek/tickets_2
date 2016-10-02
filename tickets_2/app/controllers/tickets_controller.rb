class TicketsController < ApplicationController
  before_action :current_user_customer?, only: [:create]

  # GET /tickets
  # GET /tickets.json
  def index
    if current_user.role == UserRole::CUSTOMER
      @tickets = Ticket.where('customer_id = ?', current_user.id).where('status not in (?)',[TicketStatus::DELETED]).order('created_at DESC')
    elsif current_user.role == UserRole::SUPPORT
      @tickets = Ticket.where('agent_id = ?', current_user.id).where('status not in (?)',[TicketStatus::DELETED, TicketStatus::CLOSED]).order('created_at DESC')
    end
    return render json: {tickets: @tickets}, :status => 200
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(:subject => params[:subject], :description => params[:description], :customer_id => current_user.id, :status => TicketStatus::NEW)
    @ticket.save
    return render json: {ticket: @ticket}, :status => 200
  end

  def delete_ticket
    @ticket = Ticket.find(params[:id])
    if @ticket.customer_id == current_user.id
      @ticket.status = TicketStatus::DELETED
      @ticket.save
      return render json: {ticket: @ticket}, :status => 200
    else
      return render json: {}, :status => 401
    end
  end

  private
  def current_user_customer?
    if current_user.blank? or current_user.role != UserRole::CUSTOMER
      return render json: {}, :status => 401
    end
  end
end
