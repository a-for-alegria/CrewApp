require 'spec_helper'

describe Client do
  subject(:client) {Client.new(client_name: client_name, client_secondname: client_secondname)}

  let(:client_name) {'Client'}
  let(:client_secondname) {'First'}

  it {should respond_to(:client_name)}
  it {should respond_to(:client_secondname)}
  it {should respond_to(:crews)}
  it {should respond_to(:project)}
  it {should respond_to(:budget)}

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
