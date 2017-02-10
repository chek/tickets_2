require 'rails_helper'


RSpec.describe TicketsController, type: :controller do

  fixtures :all

  describe "tickets controller" do
    before do
      @user = users(:one)
      @user_support = users(:two)
      @user_customer = users(:three)
      @ticket = tickets(:one)
      @ticket2 = tickets(:two)
    end

    it "should get index unauthorized" do
      get :index
      expect(response).to have_http_status(401)
    end

  end

end
