class UserRole
  ADMIN = 'admin'
  SUPPORT = 'support'
  CUSTOMER = 'customer'
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def tickets
    result = Ticket.where("customer_id = ?", self.id) if self.role == UserRole::CUSTOMER
    result = Ticket.where("agent_id = ?", self.id) if self.role == UserRole::SUPPORT
    result = Ticket if self.role == UserRole::ADMIN
    return result
  end

  def avaliable_statuses(next_status)
    avaliable_statuses = []
    #customer can delete IN_PROCESS or NEW ticket
    if TicketStatus::DELETED == next_status and self.role == UserRole::CUSTOMER
      avaliable_statuses = [TicketStatus::IN_PROCESS, TicketStatus::NEW]
      #customer can only confirm CLOSED ticket
    elsif TicketStatus::CONFIRMED == next_status and self.role == UserRole::CUSTOMER
      avaliable_statuses = [TicketStatus::CLOSED]
      #agent can process NEW ticket
    elsif next_status == TicketStatus::IN_PROCESS and self.role == UserRole::SUPPORT
      avaliable_statuses = [TicketStatus::NEW]
      #agent can close IN_PROCESS ticket
    elsif next_status == TicketStatus::CLOSED and self.role == UserRole::SUPPORT
      avaliable_statuses = [TicketStatus::IN_PROCESS]
      #admin can delete any ticket if not DELETED or CLOSED or CONFIRMED
    elsif TicketStatus::DELETED == next_status and self.role == UserRole::ADMIN
      avaliable_statuses = [TicketStatus::NEW, TicketStatus::IN_PROCESS]
    end
    return avaliable_statuses
  end
end
