require 'spec_helper'

describe Crew do
  before do
  	@crew = Crew.create!(name: 'Name', secondname: 'Second')
  end
  subject {@crew}

  it {should respond_to(:name)}
  it {should respond_to(:secondname)}
  it {should respond_to(:avatar)}
  it {should respond_to(:in_charge)}
  it {should respond_to(:bank_card)}
  it {should respond_to(:bank_name)}
  it {should respond_to(:client)}
  it {should respond_to(:client_project)}

  describe 'Name should be present' do
    before {@crew.name = " "}
    it {should_not be_valid}
  end
  
  describe 'Secondname should be present' do
    before {@crew.secondname = " "}
    it {should_not be_valid}
  end

  describe 'with incorrect format of bakn card number' do
    before {@crew.bank_card = "1122 3344 5566 77a8"}
    it {should_not be_valid}
  end
end
