# RSpec.shared_examples "tasks examples" do |tasks|
#   measurement_methods.each do |measurement_method|
#     it "should return #{measurement} from ##{measurement_method}" do
#       expect(subject.send(measurement_method)).to eq(measurement)
#     end
#   end
# end
#
# RSpec.shared_examples "tasks examples" do |parents, tasks|
#   context "Tasks pages" do
#
#     subject { page }
#     let(:tasks) { create_list(:task, 3) }
#
#     context "index" do
#       let(:tasks) { create_list(:task, 3) }
#       before(:each) do
#         sign_in user
#         visit users_path
#       end
#
#       it { should have_title('All tasks') }
#       it { should have_content('All tasks') }
#
#       context "if visit page" do
#
#         before(:all) { 30.times { FactoryGirl.create(:user) } }
#         after(:all)  { User.delete_all }
#
#         it { should have_selector('div.pagination') }
#
#         it "should list each user" do
#           User.paginate(page: 1).each do |user|
#             expect(page).to have_selector('li', text: user.name)
#           end
#         end
#       end
#     end
#   end
# end