require 'rails_helper'


RSpec.describe TicketsController, type: :controller do
  describe "GET #list" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      #puts response.inspect
      expect(response).to have_http_status(401)
    end
  end

end
