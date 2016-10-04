# Simple support tickets system

## To run this project you need.

  * Ruby 2.2.2

  * Rails 5

  * MySQL server
  
  * Change credentials for database in config/database.yml
  
  * Create database steps:
    
    * mysql -u root -p
    
    * CREATE DATABASE `tickets` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    
    * CREATE DATABASE `tickets_test` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    
    * exit

    * rake db:schema:load
  
    * rails db:seed
  
  * Install gems: bundle install

  * To run project: rails s

  * To run backend tests: rails test
  
  * To run client side tests:
  
    * rails s
   
    * open in browser http://localhost:3000/specs
    
## Test using
  
  From seed data in system exist 3 users admin@test.com, support@test.com, customer@test.com. Each of them has same password 'qwer1234'. Also you can register other user and assign him role from admin@test.com user
  
## Logic of the system   

  For system like explained in requirements, enough 2 logical entities (Users and Tickets).
  Is 3 type of users in the system, (Admins, Support Agents, Customers).
  All new registered users are Customers. Admin can change their role to Support Agent or Admin.
  So for beginning of work system must have at least 1 Admin.
  Only Customer can create a new Ticket, which assigns to random Support Agent.
  When Support Agent get new Ticket need set up to 'in process' state. 
  After finishing support issue Support Agent must set up it to 'closed' state.
  After that Customer can to ‘cofirm’ ticket closing. 
  Customer can set up Ticket to 'deleted' state all the time until it closed.

#### RSPEC was required but i've done the tests with built-in Rails tests

## Issues 

  * I have few issues with default bootstrap behavior of modal forms, so i fixed it with custom JS
  
  * It was some issue with Jasmine test related to AJAX requests. I tried to fix it with mock-ajax.js library, but unsuccesseful. And fixed it with spyOn( $, 'ajax' ) method.


