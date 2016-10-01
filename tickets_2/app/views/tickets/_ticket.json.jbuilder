json.extract! ticket, :id, :subject, :description, :customer_id, :agent_id, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)