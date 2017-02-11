class TicketsController < ApplicationController
  before_action :current_user_customer?, only: [:create]

  # GET /tickets
  # GET /tickets.json
  def index
    begin
      if current_user.blank?
        return render json: {}, :status => 401
      end
      if current_user.role == UserRole::CUSTOMER
        @tickets = current_user.tickets
                       .where('status not in (?)',[TicketStatus::DELETED,TicketStatus::CONFIRMED])
                       .order('created_at DESC')
      elsif current_user.role == UserRole::SUPPORT
        if !params[:report].blank?
          @tickets = current_user.tickets
                         .where('status in (?)',[TicketStatus::CLOSED,TicketStatus::CONFIRMED])
                         .where('updated_at BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()')
                         .order('created_at DESC')
        else
          @tickets = current_user.tickets
                         .where('status not in (?)',[TicketStatus::DELETED, TicketStatus::CLOSED, TicketStatus::CONFIRMED])
                         .order('created_at DESC')
        end
      elsif current_user.role == UserRole::ADMIN
        @tickets = current_user.tickets
                       .order('created_at DESC')
      end
      customers_ids = @tickets.map{|ticket| ticket.customer_id}
      @customers = User.where('id in (?)', customers_ids)
      agents_ids = @tickets.map{|ticket| ticket.agent_id}
      @agents = User.where('id in (?)', agents_ids)
      #fetch customers and agents together with tickets, search 1475435340
      return render json: {tickets: @tickets, customers: @customers, agents: @agents }, :status => 200
    rescue
      return render json: {}, :status => 500
    end
  end

  # POST /tickets
  # POST /tickets.json
  def create
    begin
      support_agents = User.where('role = ?', UserRole::SUPPORT).order("RAND()")
      support_agents_ids = support_agents.map{|support_agent| support_agent.id}
      support_agent_id = support_agents_ids.sample
      @ticket = Ticket.new(:subject => params[:subject], :description => params[:description], :agent_id => support_agent_id, :customer_id => current_user.id, :status => TicketStatus::NEW)
      @ticket.save
      return render json: {ticket: @ticket}, :status => 200
    rescue
      return render json: {}, :status => 500
    end
  end

  def update_ticket
    begin
      status = params[:status].to_i
      if !current_user.avaliable_statuses(status).blank?
        @ticket = current_user.tickets
                      .where("status in (?)", current_user.avaliable_statuses(status))
                      .where("id = ?", params[:id]).first
      else
        return render json: {}, :status => 401
      end
      if !@ticket.blank?
        @ticket.status = status
        @ticket.save
        return render json: {ticket: @ticket}, :status => 200
      else
        return render json: {}, :status => 401
      end
    rescue Exception => ex
      return render json: {}, :status => 500
    end
  end
end
