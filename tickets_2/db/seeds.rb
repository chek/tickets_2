# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create(:email => 'admin@test.com', :password => 'qwer1234', :password_confirmation => 'qwer1234', :role => UserRole::ADMIN)
support = User.create(:email => 'support@test.com', :password => 'qwer1234', :password_confirmation => 'qwer1234', :role => UserRole::SUPPORT)
customer = User.create(:email => 'customer@test.com', :password => 'qwer1234', :password_confirmation => 'qwer1234', :role => UserRole::CUSTOMER)

Ticket.create(:subject => "Thank you. Support.", :description => "I thankful for solving my issue.", :customer_id => customer.id, :agent_id => support.id, :status => TicketStatus::CLOSED)
Ticket.create(:subject => "Please help me.", :description => "I can't generate my report for whole month but in my plan i have this ability.", :customer_id => customer.id, :agent_id => support.id, :status => TicketStatus::NEW)
Ticket.create(:subject => "Refund.", :description => "I want downgrade my plan and want to refund", :customer_id => customer.id, :agent_id => support.id, :status => TicketStatus::IN_PROCESS)
Ticket.create(:subject => "Whats wrong? ", :description => "I upgraded to Bussiness plan, but in my profile appear i have free account", :customer_id => customer.id, :agent_id => support.id, :status => TicketStatus::IN_PROCESS)
Ticket.create(:subject => "I have email issue", :description => "Each email from your system i got twice. Can you don't spam me?", :customer_id => customer.id, :agent_id => support.id, :status => TicketStatus::NEW)
