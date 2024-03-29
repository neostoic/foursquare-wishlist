require 'spec_helper'

describe SessionsController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      expect(response).to be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      expect(response).to be_success
    end
  end

  describe "GET 'failure'" do
    it "returns http success" do
      get 'failure'
      expect(response).to be_success
    end
  end

end
