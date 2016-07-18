require 'spec_helper'

describe FlamesController, type: :controller do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index', format: 'json'
      expect(response).to be_success
    end
  end
end
