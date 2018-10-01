require 'rails_helper'

RSpec.feature "List pages", type: :feature do
  let(:lists) { create_list(:list_with_tasks, 3) }

  context "index" do
    before(:each) { visit list_tasks_path(lists.first) }
    it_behaves_like "index lists examples"
  end
  
  context "show" do
    before(:each) { visit list_path(lists.first) }
    it_behaves_like "show lists examples"
  end
  
  # context "when click remote link" do
  #   before(:each) { click_link list.last.name }
  #
  #   it "index" do
  #     lists.each do |list|
  #       expect(page).to have_link(list.name)
  #     end
  #   end
  # end
  
  #index
  #show
  #new
  #edit
  #create
  #update
  #destroy
  #sort
  
  context "if visit page" do  
    before(:each) do
      visit list_tasks_path(lists.first)
    end
    
    it "displays task names" do
      expect(page).to have_link(lists.first.tasks.first.name)
    end
  end
end
