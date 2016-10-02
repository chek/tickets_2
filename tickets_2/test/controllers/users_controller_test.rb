require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
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

end
