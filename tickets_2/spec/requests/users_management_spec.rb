require 'rails_helper'


RSpec.describe "Users management", type: :request do

  fixtures :all

  describe "users controller" do
    before do
      @user = users(:one)
      @user_support = users(:two)
    end

    it "should sign_in_ajax" do
      post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
      expect(response).to have_http_status(200)
    end

    it "should sign_in_ajax error 401" do
      post '/users/sign_in_ajax', email: @user.email, password: 'qwer12345'
      expect(response).to have_http_status(401)
    end

    it "should sign_in_ajax error 404" do
      post '/users/sign_in_ajax', email: 'asd@xfsd.cv', password: 'qwer1234'
      expect(response).to have_http_status(404)
    end

    it "should sign_up_ajax" do
      post '/users/sign_up_ajax', email: 'asd@xfsd.cv', password: 'qwer1234'
      expect(response).to have_http_status(200)
    end

    it "should sign_up_ajax error" do
      post '/users/sign_up_ajax', email: @user.email, password: 'qwer1234'
      expect(response).to have_http_status(406)
    end

    it "should sign_out_ajax" do
      post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
      expect(response).to have_http_status(200)
      post '/users/sign_out_ajax'
      expect(response).to have_http_status(200)
    end

    it "should sign_out_ajax error" do
      post '/users/sign_out_ajax'
      expect(response).to have_http_status(404)
    end

    it "should index" do
      post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
      expect(response).to have_http_status(200)
      get '/users/list'
      expect(response).to have_http_status(200)
    end

    it "should index error" do
      get '/users/list'
      expect(response).to have_http_status(401)
    end

    it "should index error for support user" do
      post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
      expect(response).to have_http_status(200)
      get '/users/list'
      expect(response).to have_http_status(401)
    end

    it "should update_role" do
      post '/users/sign_in_ajax', email: @user.email, password: 'qwer1234'
      expect(response).to have_http_status(200)
      post '/users/update_role', id: @user_support.id, role: UserRole::CUSTOMER
      expect(response).to have_http_status(200)
    end

    it "should update_role error for support user" do
      post '/users/sign_in_ajax', email: @user_support.email, password: 'qwer1234'
      expect(response).to have_http_status(200)
      post '/users/update_role', id: @user_support.id, role: UserRole::CUSTOMER
      expect(response).to have_http_status(401)
    end
   end

end
