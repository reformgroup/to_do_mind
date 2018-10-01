RSpec.shared_examples "index lists examples" do
  it { expect(page).to have_title(lists.first.name) }
  it { lists.each { |list| expect(page).to have_link(list.name) }}
end

RSpec.shared_examples "show lists examples" do
  it_behaves_like "index lists examples"
  
  it "show" do
    expect(page).to have_title(lists.first.name)
    
    lists.each do |list|
      expect(page).to have_link(list.name)
    end
  end
end