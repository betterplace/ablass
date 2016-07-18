require 'spec_helper'

describe SinProjectsController, type: :controller do
  describe "GET 'index'" do
    let :sin do FactoryGirl.create(:sin) end

    it "returns http success" do
      get 'index', sin_id: sin
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    let :sin_project do
      FactoryGirl.create(:sin_project)
    end

    it "returns http success" do
      get 'show', sin_id: sin_project.sin, id: sin_project
      expect(response).to be_success
    end
  end
end
