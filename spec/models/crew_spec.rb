require 'spec_helper'

describe Crew do
  before do
  	@crew = Crew.create!(name: "Name", secondname: "Second")
  end
  subject {@crew}

  it {should respond_to(:name)}
  it {should respond_to(:secondname)}

  describe "Name should be present" do
    before {@crew.name = " "}
    it {should_not be_valid}
  end
  
  describe "Secondname should be present" do
    before {@crew.secondname = " "}
    it {should_not be_valid}
  end
end
