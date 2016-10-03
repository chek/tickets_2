# Simple support tickets system

## To run this project you need.

  * Ruby 2.2.2

  * Rails 5

  * MySQL server
  
  * Change database name and credentials in config/database.yml

  * Create database tables using: rake db:schema:load
  
  * Fill initial data using: rails db:seed
  
  * Install gems: bundle install
  
  * Project using backbone library which will be installed during bundle install

  * To run project: rails s

  * To run backend tests: rails test
  
  * To run client side test open in browser http://localhost:3000/specs

## Logic of the system   

  For system like explained in requirements, enough 2 logical entities (Users and Tickets).
  Is 3 type of users in the system, (Admins, Support Agents, Customers).
  All new registered users are Customers. Admin can change their role to Support Agent or Admin.
  So for beginning of work system must have at least 1 Admin.
  Only Customer can create a new Ticket, which assigns to random Support Agent.
  When Support Agent get new Ticket need set up to 'in process' state. 
  After finishing support issue Support Agent must set up it to 'closed' state.
  Customer can set up Ticket to 'deleted' state all the time until it closed.
