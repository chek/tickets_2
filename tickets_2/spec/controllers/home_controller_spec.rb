require 'rails_helper'


RSpec.describe HomeController, type: :controller do

  describe "home controller" do

    it "should get index" do
      # get home_index_url
      get 'index'
      expect(response).to have_http_status(200)
    end

  end

end
