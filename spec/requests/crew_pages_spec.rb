require 'spec_helper'

describe 'CrewPage' do
  subject {page}
  
  let(:user) {FactoryGirl.create(:user)}
  before {sign_in(user)}
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
        fill_in 'Rate',               with: 1000
      end
      it 'should create crew member' do
        expect{click_button submit}.to change(Crew, :count).by(1)
      end
    end
  end

#==============================Show page===========>>

  describe 'show page' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First', rate: 1000)
      visit crew_path(@crew)
    end

    it {should have_title("#{@crew.combine_names} profile")}
  end

#==============================Edit page===========>>

  describe 'edit page' do
    before do
      @crew = Crew.create(name: 'Name', secondname: 'First', rate: 1000)
      visit edit_crew_path(@crew)
    end
    it {should have_title('Edit panel')}

    describe 'successfull edit' do
    	before do
        fill_in 'Name',               with: 'Reloadname'
        fill_in 'Secondname',         with: 'Reloadsecondname'
        fill_in 'Rate',               with: 1000
        click_button('Save')
      end
      it {should have_content('Reloadname')}
      it {should have_content('Reloadsecondname')}
    end
  end

#==============================Delete action===========>>

	describe 'delete action from index page' do
		before do
			@crew = Crew.create(name: 'Name', secondname: 'First', rate: 1000)
			visit root_path
		end

		it {should have_content('delete')}
		it 'should delete crew member' do
			expect{click_link('delete')}.to change(Crew, :count).by(-1)
		end
	end
end

