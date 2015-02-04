require 'spec_helper'

describe 'ClientPage' do
  subject {page}
  let(:user) {FactoryGirl.create(:user)}
  before {sign_in(user)}
#==============================New page===========>>

  describe 'new client page' do

    before {visit new_client_path}

    it {should have_title('New client')}

    let(:submit) {"Create"}

    describe 'invalid creation' do
      it 'should not create client' do
        expect{click_button submit}.not_to change(Client, :count)
      end
    end

    describe 'valid client creation' do
      before do
        fill_in 'Client name',               with: 'Client'
        fill_in 'Client secondname',         with: 'Rocks'
        fill_in 'Budget',                    with: 3000
      end
      it 'should create client' do
        expect{click_button submit}.to change(Client, :count).by(1)
      end
    end
  end

#==============================Show page===========>>

  describe 'show page' do
    before do
      @client = Client.create(client_name: 'Client', client_secondname: 'First', budget: 3000)
      visit client_path(@client)
    end

    it {should have_title("#{@client.combine_names} profile")}
  end

#==============================Edit page===========>>

  describe 'edit page' do
    before do
      @client = Client.create(client_name: 'Client', client_secondname: 'First', budget: 3000)
      visit edit_client_path(@client)
    end
    it {should have_title('Edit client panel')}

    describe 'successfull edit' do
    	before do
        fill_in 'Client name',              with: 'Reloadclientname'
        fill_in 'Client secondname',        with: 'Reloadclientsecondname'
        fill_in 'Budget',                   with: 3000*2
        click_button('Save')
      end
      it {should have_content('Reloadclientname')}
      it {should have_content('Reloadclientsecondname')}
      it {should have_content(6000)}
    end
  end

#==============================Delete action===========>>

	describe 'delete action from index page' do
		before do
			@client = Client.create(client_name: 'Client', client_secondname: 'First', budget: 3000)
			visit root_path
		end

		it {should have_content('delete')}
		it 'should delete client' do
			expect{click_link('delete')}.to change(Client, :count).by(-1)
		end
	end
end