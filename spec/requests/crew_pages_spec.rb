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
end