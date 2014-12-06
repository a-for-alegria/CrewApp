require 'spec_helper'

describe 'CrewPage' do
  subject {page}

  describe 'main page' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First')
      visit root_path
    end
    it {should have_title('Dashboard')}
    it {should have_content('Ace Team')}
    it {should have_link('Add member', href: new_crew_path)}
    it 'should list all the crew members' do
      expect(page).to have_selector('li', text: @crew.name)
    end
  end

  describe 'new crew member page' do
    before {visit new_crew_path}

    it {should have_title('New member')}
    it {should have_content('New member')}
    it {should have_link('return to Dashboard', href: root_path)}

    let(:submit) {"Create"}

    describe 'invalid creation' do
      it 'should not create crew member' do
        expect{click_button submit}.not_to change(Crew, :count)
      end
    end

    describe 'valid crew member creation' do
      before do
        fill_in 'Name',               with: 'Ace'
        fill_in 'Secondname',         with: 'Team'
      end
      it 'should create crew member' do
        expect{click_button submit}.to change(Crew, :count).by(1)
      end
    end
  end

  describe 'crew member personal profile' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First')
      visit root_path
      click_link(@crew.name, crew_path(@crew))
    end

    it {should have_title("#{@crew.combine_names} profile")}
    it {should have_selector('h1', text: @crew.combine_names)}
    it {should have_link('return to Dashboard', href: root_path)}
    it {should have_link('Edit', href: edit_crew_path(@crew))}
  end

  describe 'update action for crew' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First')
      visit edit_crew_path(@crew)
    end
    it {should have_title('Edit panel')}
    it {should have_link('Cancel', href: crew_path(@crew))}
  end
end

