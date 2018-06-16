require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views
  let(:base_name) { "To do mind" }
  
  describe "GET #home" do
    before { get :home }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "should have the title 'Home'" do
      expect(response.body).to have_title("#{base_name}")
    end
  end
  
  describe "GET #help" do
    before { get :help }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "should have the title 'Help'" do
      expect(response.body).to have_title("Help | #{base_name}")
    end
  end
end
