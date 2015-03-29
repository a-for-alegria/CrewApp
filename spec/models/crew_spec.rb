require 'spec_helper'

describe Crew do
  
  let(:user) {FactoryGirl.create(:user)}
  subject (:crew) {user.crews.build(name: name, secondname: secondname, rate: rate, spec: spec)}

  let(:name) {'Name'}
  let(:secondname) {'Second'}
  let(:rate) {2000}
  let(:spec) {'Frontend'}

  it {should respond_to(:name)}
  it {should respond_to(:secondname)}
  it {should respond_to(:avatar)}
  it {should respond_to(:client)}
  it {should respond_to(:client_project)}
  it {should respond_to(:spec)}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  its(:user) {should eq user}

  it {should be_valid}

  context '#name' do
    before {crew.name = " "}
    it {should_not be_valid}
  end
  
  context '#secondname' do
    before {crew.secondname = " "}
    it {should_not be_valid}
  end

  context '#spec' do
    before {crew.spec = " "}
    it {should_not be_valid}
  end

  context 'with incorrect format of bakn card number' do
    before {crew.bank_card = '1122 3344 5566 77a8'}
    it {should_not be_valid}
  end
end
