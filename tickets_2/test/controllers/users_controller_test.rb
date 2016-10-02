require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user_support = users(:two)
  end

  test "should sign_in_ajax" do
    post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
    assert_response :success
  end

  test "should sign_in_ajax error 401" do
    post '/users/sign_in_ajax', email: @user.email, password: 'qwer12345'
    assert_response 401
  end

  test "should sign_in_ajax error 404" do
    post '/users/sign_in_ajax', email: 'asd@xfsd.cv', password: 'qwer1234'
    assert_response 404
  end

  test "should sign_up_ajax" do
    post '/users/sign_up_ajax', email: 'asd@xfsd.cv', password: 'qwer1234'
    assert_response :success
  end

  test "should sign_up_ajax error" do
    post '/users/sign_up_ajax', email: @user.email, password: 'qwer1234'
    assert_response 406
  end

  test "should sign_out_ajax" do
    post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
    assert_response :success
    post '/users/sign_out_ajax'
    assert_response :success
  end

  test "should sign_out_ajax error" do
    post '/users/sign_out_ajax'
    assert_response 404
  end

  test "should index" do
    post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
    assert_response :success
    get '/users/list'
    assert_response :success
  end

  test "should index error" do
    get '/users/list'
    assert_response 401
  end

  test "should index error for support user" do
    post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
    assert_response :success
    get '/users/list'
    assert_response 401
  end

  test "should update_role" do
    post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
    assert_response :success
    post '/users/update_role', id: @user_support.id, role: UserRole::CUSTOMER
    assert_response :success
  end

  test "should update_role error for support user" do
    post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
    assert_response :success
    post '/users/update_role', id: @user_support.id, role: UserRole::CUSTOMER
    assert_response 401
  end

end
