require 'spec_helper'

describe 'DashboardPage' do
  subject {page}

  before(:each) do 
    @user = User.new(email: "alegria1634@gmail.com", password: 'password1634', password_confirmation: 'password1634')
    login_as(@user)
  end
#==============================Index page===========>>

  describe 'main page/index' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First')
      @client = Client.create(client_name: 'Client', client_secondname: 'First', project: 'Project')
      visit root_path
    end
    it {should have_title('Dashboard')}
    it {should have_link('Add member', href: new_crew_path)}
    it {should have_link('Add client', href: new_client_path)}
    it 'should list all the crew members' do
      expect(page).to have_selector('li', text: @crew.name)
    end
    it 'should list all the clients' do
      expect(page).to have_selector('li', text: @client.client_name)
    end
  end
end