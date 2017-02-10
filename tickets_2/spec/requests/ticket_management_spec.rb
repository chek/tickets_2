require 'rails_helper'


RSpec.describe "Tickets management", type: :request do

  fixtures :all

  describe "tickets controller" do
    before do
      @user = users(:one)
      @user_support = users(:two)
      @user_customer = users(:three)
      @ticket = tickets(:one)
      @ticket2 = tickets(:two)
    end

    it "should get index" do
      post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
      get '/tickets/list'
      expect(response).to have_http_status(200)
    end

    it "should create ticket" do
      post '/users/sign_in_ajax', email: @user_customer.email, password: 'qwer1234'
      post '/tickets/create', subject: 'subject', description: 'description'
      expect(response).to have_http_status(200)
    end

    it "should not create ticket" do
      post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
      post '/tickets/create', subject: 'subject', description: 'description'
      expect(response).to have_http_status(401)
    end

    it "should update_ticket" do
      post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
      patch '/tickets/update_ticket', id: @ticket.id, status: TicketStatus::IN_PROCESS
      expect(response).to have_http_status(200)
    end

    it "should not update_ticket" do
      post '/users/sign_in_ajax', email: @user_customer.email, password: 'qwer1234'
      patch '/tickets/update_ticket', id: @ticket.id, status: TicketStatus::IN_PROCESS
      expect(response).to have_http_status(401)
    end

  end

end
