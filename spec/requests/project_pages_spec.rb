require 'spec_helper'

describe 'ProjectPage' do
  subject {page}
  let(:user) {FactoryGirl.create(:user)}
  let!(:project) {user.projects.create(client_name: client_name, client_secondname: client_secondname, 
      budget: budget, project_name: project_name)}
  let(:client_name) {'Client'}
  let(:client_secondname) {'First'}
  let(:budget) {3000}
  let(:project_name) {'Project'}

  before {sign_in(user)}
  #==============================New page===========>>

  describe 'new project page' do

    before {visit root_path}

    it {should have_title('Dashboard')}

    let(:submit) {"Create project"}
    
    describe 'create' do
      context 'invalid creation' do
        it 'should not create project' do
          expect{click_button submit}.not_to change(Project, :count)
        end
      end

      context 'valid project creation' do
        before do
          fill_in 'Client name',               with: client_name
          fill_in 'Client secondname',         with: client_secondname
          fill_in 'Budget',                    with: budget
          fill_in 'Project name',              with: project_name
        end
        it 'should create project' do
          expect{click_button submit}.to change(Project, :count).by(1)
        end
      end
    end  
  end

  #==============================Show page===========>>

  describe 'show' do
    before {visit project_path(project)}

    it {should have_title("#{project.combine_names} page")}
  end

  #==============================Edit page===========>>

  describe 'edit' do
    let(:reload_cn) {client_name*2}
    let(:reload_csn) {client_secondname*2}
    let(:reload_bgt) {project.budget*2}
    let(:reload_prg) {project.project_name*2}

    before {visit edit_project_path(project)}
    
    it {should have_title('Edit project panel')}

    context 'successfull edit' do
    	before do
        fill_in 'Client name',              with: reload_cn
        fill_in 'Client secondname',        with: reload_csn
        fill_in 'Budget',                   with: reload_bgt
        click_button('Save')
      end
      it {should have_content(reload_cn)}
      it {should have_content(reload_csn)}
      it {should have_content(reload_bgt)}
    end
  end

  #==============================Delete action===========>>

	describe 'delete' do
		before do
			@project = user.projects.create(client_name: client_name, client_secondname: client_secondname, budget: budget, project_name: project_name)
			visit root_path
		end

		it 'should delete project' do
			expect{@project.delete}.to change(Project, :count).by(-1)
		end
	end
end