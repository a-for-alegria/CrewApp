require 'spec_helper'

describe 'CrewPage' do
  subject {page}

#==============================Index page===========>>

  describe 'main page/index' do
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

#==============================New page===========>>

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

#==============================Show page===========>>

  describe 'show page' do
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

#==============================Edit page===========>>

  describe 'edit page' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First')
      visit edit_crew_path(@crew)
    end
    it {should have_title('Edit panel')}
    it {should have_link('Cancel', href: crew_path(@crew))}

    describe 'edit action' do  	
    	
    	# describe 'unseccessfull edit' do
    	# 	let(:submit) {'Save'}
	    # 	it "should not save changes" do
	        
	    #   end
	    # end

	    describe 'successfull edit' do
	    	before do
	        fill_in 'Name',       with: 'Reloadname'
	        fill_in 'Secondname', with: 'Reloadsecondname'
	        click_button('Save')
	      end
	      it {should have_content('Reloadname')}
	      it {should have_content('Reloadsecondname')}
	    end
    end
  end
end

