require 'spec_helper'

describe Client do

  let(:user) {FactoryGirl.create(:user)}
  subject(:client) {user.clients.build(client_name: client_name, client_secondname: client_secondname, project: project, budget: budget)}

  let(:client_name) {'Client'}
  let(:client_secondname) {'First'}
  let(:budget) {4000}
  let(:project) {'Fulltime'}

  it {should respond_to(:client_name)}
  it {should respond_to(:client_secondname)}
  it {should respond_to(:crews)}
  it {should respond_to(:project)}
  it {should respond_to(:budget)}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  its(:user) {should eq user}

  it {should be_valid}

  context "Name should be present" do
    before{client.client_name = " "}
    it {should_not be_valid}
  end
  
  context "Secondname should be present" do
    before{client.client_secondname = " "}
    it {should_not be_valid}
  end

  context "Project should be present" do
    before {client.project = " "}
    it {should_not be_valid}
  end

  context "Budget should be present" do
    before {client.budget = " "}
    it {should_not be_valid}
  end
end
