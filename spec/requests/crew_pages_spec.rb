require 'spec_helper'

describe "CrewPage" do
  subject {page}

  describe "Main page" do
    before {visit root_path}
    it {should have_title('Dashboard')}
    it {should have_content('Ace Team')}
    it {should have_link('Add member', href: new_crew_path)}
  end

  describe "New crew mate" do
    before {visit new_crew_path}
    it {should have_title('New member')}
    it {should have_content('New member')}
    it {should have_link('To Dashboard', href: root_path)}
  end

  describe "New crew member page" do
    before {visit new_crew_path}

    let(:submit) {"Create"}

    describe "Invalid creation" do
      it "should not create crew member" do
        expect{click_button submit}.not_to change(Crew, :count)
      end
    end

    describe "Valid crew member creation" do
      before do
        fill_in "Name",               with: "Ace"
        fill_in "Secondname",         with: "Team"
      end
      it "should create crew member" do
        expect{click_button submit}.to change(Crew, :count).by(1)
      end
    end
  end
end