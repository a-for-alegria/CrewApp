require 'spec_helper'

describe 'CrewPage' do
  subject {page}
  
  let(:user) {FactoryGirl.create(:user)}
  let!(:crew) {Crew.create(name: name, secondname: secondname, rate: rate, spec: spec, dob: dob)}
  let(:name) {'Name'}
  let(:secondname) {'First'}
  let(:rate) {1000}
  let(:spec) {'Frontend'}
  let(:dob) {Time.now.to_date}

  before {sign_in(user)}
  #==============================New page===========>>
  describe 'new crew member' do
    before {visit root_path}

    it {should have_title('Dashboard')}

    let(:submit) {"Create crew member"}

    context 'valid crew member creation' do
      before do
        fill_in 'Name',               with: name
        fill_in 'Secondname',         with: secondname
        fill_in 'Rate',               with: rate
        fill_in 'Spec',               with: spec
        fill_in 'Spec',               with: dob
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
        fill_in 'Spec',               with: reload_s
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

		it 'should delete crew member' do
			expect{crew.delete}.to change(Crew, :count).by(-1)
		end
	end
end

