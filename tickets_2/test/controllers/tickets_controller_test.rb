require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_admin = users(:one)
    @user_support = users(:two)
    @user_customer = users(:three)
    @ticket = tickets(:one)
    @ticket2 = tickets(:two)
  end

  test "should get index" do
    post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
    get '/tickets/list'
    assert_response :success
  end

  test "should get index unauthorized " do
    get '/tickets/list'
    assert_response 401
  end

  test "should create ticket" do
    post '/users/sign_in_ajax', email: @user_customer.email, password: 'qwer1234'
    post '/tickets/create', subject: 'subject', description: 'description'
    assert_response :success
  end

  test "should not create ticket" do
    post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
    post '/tickets/create', subject: 'subject', description: 'description'
    assert_response 401
  end

  test "should update_ticket" do
    post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
    patch '/tickets/update_ticket', id: @ticket.id, status: TicketStatus::IN_PROCESS
    assert_response :success
  end

  test "should not update_ticket" do
    post '/users/sign_in_ajax', email: @user_customer.email, password: 'qwer1234'
    patch '/tickets/update_ticket', id: @ticket.id, status: TicketStatus::IN_PROCESS
    assert_response 401
  end

  test "admin should delete_ticket" do
    post '/users/sign_in_ajax', email: @user_admin.email, password: 'qwer1234'
    patch '/tickets/update_ticket', id: @ticket.id, status: TicketStatus::DELETED
    assert_response 200
  end

end
