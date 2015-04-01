require 'spec_helper'

describe 'ClientPage' do
  subject {page}
  let(:user) {FactoryGirl.create(:user)}
  let(:client) {user.clients.build(client_name: client_name, client_secondname: client_secondname, 
      budget: budget, project: project)}
  let(:client_name) {'Client'}
  let(:client_secondname) {'First'}
  let(:budget) {3000}
  let(:project) {'Project'}

  before {sign_in(user)}
  #==============================New page===========>>

  describe 'new client page' do

    before {visit new_client_path}

    it {should have_title('New client')}

    let(:submit) {"Create"}
    
    describe 'create' do
      context 'invalid creation' do
        it 'should not create client' do
          expect{click_button submit}.not_to change(Client, :count)
        end
      end

      context 'valid client creation' do
        before do
          fill_in 'Client name',               with: client_name
          fill_in 'Client secondname',         with: client_secondname
          fill_in 'Budget',                    with: budget
          fill_in 'Project',                   with: project
        end
        it 'should create client' do
          expect{click_button submit}.to change(Client, :count).by(1)
        end
      end
    end  
  end

  #==============================Show page===========>>

  describe 'show' do
    before {visit client_path(client)}
    it {should have_title("#{client.combine_names} profile")}
  end

  #==============================Edit page===========>>

  describe 'edit' do
    let(:reload_cn) {client_name*2}
    let(:reload_csn) {client_secondname*2}
    let(:reload_bgt) {client.budget*2}
    let(:reload_prg) {client.project*2}

    before {visit edit_client_path(client)}
    
    it {should have_title('Edit client panel')}

    context 'successfull edit' do
    	before do
        fill_in 'Client name',              with: reload_cn
        fill_in 'Client secondname',        with: reload_csn
        fill_in 'Budget',                   with: reload_bgt
        fill_in 'Project',                  with: reload_prg
        click_button('Save')
      end
      it {should have_content(reload_cn)}
      it {should have_content(reload_csn)}
      it {should have_content(reload_bgt)}
      it {should have_content(reload_prg)}
    end
  end

  #==============================Delete action===========>>

	describe 'delete' do
		before do
			@client = user.clients.build(client_name: client_name, client_secondname: client_secondname, budget: budget, project: project)
			visit root_path
		end

		it 'should delete client' do
			expect{@client.delete}.to change(Client, :count).by(-1)
		end
	end
end