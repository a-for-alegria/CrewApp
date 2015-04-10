require 'spec_helper'

describe Project do

  let(:user) {FactoryGirl.create(:user)}
  subject(:project) {user.projects.build(client_name: client_name, client_secondname: client_secondname, project_name: project, budget: budget)}

  let(:client_name) {'Client'}
  let(:client_secondname) {'First'}
  let(:budget) {4000}
  let(:project_name) {'Fulltime'}

  it {should respond_to(:client_name)}
  it {should respond_to(:client_secondname)}
  it {should respond_to(:crews)}
  it {should respond_to(:project_name)}
  # it {should respond_to(:budget)}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  its(:user) {should eq user}

  it {should be_valid}

  context "Name should be present" do
    before{project.client_name = " "}
    it {should_not be_valid}
  end
  
  context "Secondname should be present" do
    before{project.client_secondname = " "}
    it {should_not be_valid}
  end

  context "Project should be present" do
    before {project.project_name = " "}
    it {should_not be_valid}
  end

  context "Budget should be present" do
    before {project.budget = " "}
    it {should_not be_valid}
  end
end
