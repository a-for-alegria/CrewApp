require 'spec_helper'

describe Client do
  before do
  	@client = Client.create(client_name: 'Client', client_secondname: 'First')
  end
  subject {@client}

  it {should respond_to(:client_name)}
  it {should respond_to(:client_secondname)}

  describe "Name should be present" do
    before {@client.client_name = " "}
    it {should_not be_valid}
  end
  
  describe "Secondname should be present" do
    before {@client.client_secondname = " "}
    it {should_not be_valid}
  end
end
