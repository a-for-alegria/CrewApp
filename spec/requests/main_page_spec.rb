require 'spec_helper'

describe 'DashboardPage' do
  subject {page}

  let(:user) {FactoryGirl.create(:user)}
  before {sign_in(user)}
#==============================Index page===========>>

  describe 'main page/index' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First', rate: 1000, spec: 'Frontend')
      @client = Client.create(client_name: 'Client', client_secondname: 'First', budget: 3000)
      visit root_path
    end
    it {should have_title('Dashboard')}
    it 'should list all the crew members' do
      expect(page).to have_selector('li', text: @crew.name)
    end
    it 'should list all the clients' do
      expect(page).to have_selector('li', text: @client.project)
    end
  end
end