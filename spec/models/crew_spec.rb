require 'spec_helper'

describe Crew do

  subject (:crew) {Crew.new(name: 'Name', secondname: 'Second', rate: 2000)}

  let(:name) {'Name'}
  let(:secondname) {'Second'}
  let(:budget) {2000}

  it {should respond_to(:name)}
  it {should respond_to(:secondname)}
  it {should respond_to(:avatar)}
  it {should respond_to(:client)}
  it {should respond_to(:client_project)}

  describe '#name' do
    before {crew.name = " "}
    it {should_not be_valid}
  end
  
  context '#secondname' do
    before {crew.secondname = " "}
    it {should_not be_valid}
  end

  context 'with incorrect format of bakn card number' do
    before {crew.bank_card = '1122 3344 5566 77a8'}
    it {should_not be_valid}
  end
end
