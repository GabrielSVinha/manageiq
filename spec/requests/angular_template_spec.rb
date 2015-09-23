require "spec_helper"

describe "/angular_template/*" do
  context "foo" do
    before :each do
      ApplicationController.any_instance.stub(:set_user_time_zone)
    end

    it "returns test template" do
      get "/angular_template/test"
      expect(response.status).to eq(200)
      expect(response.body).to start_with('<!--')
    end

    it "renders haml template" do
      get "/angular_template/test_haml"
      expect(response.status).to eq(200)
      expect(response.body).to match(/<div class=['"]testclass['"]>/)
      expect(response.body).not_to include(".testclass")
    end
  end
end
