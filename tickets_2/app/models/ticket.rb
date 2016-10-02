class TicketStatus
  #tickets statuses, search 1475436409
  NEW = 0
  IN_PROCESS = 1
  CLOSED = 2
  DELETED = 4
end

class Ticket < ApplicationRecord

  def customer_email
    customer = User.find(customer_id)
    return customer.email
  end

end
