require 'spec_helper'

describe SinProject do
  let :sin_project do
    FactoryGirl.build(:sin_project)
  end

  it "can be valid" do
    expect(sin_project).to be_valid
  end

  it "belongs to a sin" do
    sin_project.sin = nil
    expect(sin_project).to have(1).errors_on(:sin)
  end

  it "has a name present" do
    sin_project.name = nil
    expect(sin_project).to have(1).errors_on(:name)
  end

  it "has a description present" do
    sin_project.description = nil
    expect(sin_project).to have(1).errors_on(:description)
  end

  it "has the numeric id of a betterplace object" do
    sin_project.betterplace_id = 0
    expect(sin_project).to have(1).errors_on(:betterplace_id)
    sin_project.betterplace_id = nil
    expect(sin_project).to have(2).errors_on(:betterplace_id)
  end

  it "can build a betterplace platform URL" do
    expect(sin_project.betterplace_platform_url).to be_a URI::HTTP
  end
end
