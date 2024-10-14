require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  describe "GET /settings" do
    it "returns http success" do
      get "/admin/users/settings"
      expect(response).to have_http_status(:success)
    end
  end

end
