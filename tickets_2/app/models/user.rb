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
    result = Ticket.where('status not in (?)',[TicketStatus::DELETED, TicketStatus::CLOSED, TicketStatus::CONFIRMED]) if self.role == UserRole::ADMIN
    return result
  end

end
