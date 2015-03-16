require 'spec_helper'

describe 'CrewPage' do
  subject {page}
  
  let(:user) {FactoryGirl.create(:user)}
  let!(:crew) {Crew.create(name: name, secondname: secondname, rate: rate, spec: spec)}
  let(:name) {'Name'}
  let(:secondname) {'First'}
  let(:rate) {1000}
  let(:spec) {'Frontend'}

  before {sign_in(user)}
  #==============================New page===========>>
  describe 'new crew member page' do
    before {visit new_crew_path}

    it {should have_title('New member')}

    let(:submit) {"Create"}

    context 'invalid creation' do
      it 'should not create crew member' do
        expect{click_button submit}.not_to change(Crew, :count)
      end
    end

    context 'valid crew member creation' do
      before do
        fill_in 'Name',               with: name
        fill_in 'Secondname',         with: secondname
        fill_in 'Rate',               with: rate
        fill_in 'Spec',               with: spec
      end
      it 'should create crew member' do
        expect{click_button submit}.to change(Crew, :count).by(1)
      end
    end
  end

  #==============================Show page===========>>
  describe 'show page' do
    before {visit crew_path(crew)}

    it {should have_title("#{crew.combine_names} profile")}
  end

  #==============================Edit page===========>>
  describe 'edit page' do

    let(:reload_n) {name*2}
    let(:reload_sn) {secondname*2}
    let(:reload_r) {rate*2}
    let(:reload_s) {spec*2}

    before {visit edit_crew_path(crew)}

    it {should have_title('Edit panel')}

    context 'successfull edit' do
    	before do
        fill_in 'Name',               with: reload_n
        fill_in 'Secondname',         with: reload_sn
        fill_in 'Rate',               with: reload_r
        fill_in 'Spec',     with: reload_s
        click_button('Save')
      end
      it {should have_content(reload_n)}
      it {should have_content(reload_sn)}
      it {should have_content(reload_r)}
      it {should have_content(reload_s)}
    end
  end

  #==============================Delete action===========>>
	describe 'delete action from index page' do
		before {visit root_path}

		it {should have_content('delete')}
		it 'should delete crew member' do
			expect{click_link('delete')}.to change(Crew, :count).by(-1)
		end
	end
end

