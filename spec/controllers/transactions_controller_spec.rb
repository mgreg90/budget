require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do

  describe "GET #create_many_from_csv" do
    it "returns http success" do
      get :create_many_from_csv
      expect(response).to have_http_status(:success)
    end
  end

end
