require 'spec_helper'

describe 'CrewPage' do
  subject {page}
  
  before(:each) do 
    @user = User.new(email: "alegria1634@gmail.com", password: 'password1634', password_confirmation: 'password1634')
    login_as(@user)
  end
#==============================New page===========>>

  describe 'new crew member page' do
    before {visit new_crew_path}

    it {should have_title('New member')}

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
        fill_in 'Bank card',          with: '1122 3344 5566 7788'
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
      click_link('Profile', crew_path(@crew))
    end

    it {should have_title("#{@crew.combine_names} profile")}
  end

#==============================Edit page===========>>

  describe 'edit page' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First')
      visit edit_crew_path(@crew)
    end
    it {should have_title('Edit panel')}
    it {should have_link('Cancel', href: crew_path(@crew))}

    describe 'successfull edit' do
    	before do
        fill_in 'Name',       with: 'Reloadname'
        fill_in 'Secondname', with: 'Reloadsecondname'
        click_button('Save')
      end
      it {should have_content('Reloadname')}
      it {should have_content('Reloadsecondname')}
    end

    describe 'check \'in_charge\' checkbox' do
      before do
        visit edit_crew_path(@crew)
        check "In charge"
        click_button('Save')
      end
      it {should have_selector('li', text: 'Privileged member')}
    end

    describe 'uncheck \'in_charge\' checkbox' do
      before do
        visit edit_crew_path(@crew)
        uncheck "In charge"
        click_button('Save')
      end
      it {should_not have_content('Privileged member')}
    end
  end

#==============================Delete action===========>>

	describe 'delete action from index page' do
		before do
			@crew = Crew.create(name: 'Name', secondname: 'First')
			visit root_path
		end

		it {should have_content('delete')}
		it 'should delete crew member' do
			expect{click_link('delete')}.to change(Crew, :count).by(-1)
		end
	end
end

