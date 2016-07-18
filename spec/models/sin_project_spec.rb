require 'spec_helper'

describe SinProject do
  let :sin_project do
    FactoryGirl.build(:sin_project, betterplace_id: 1114)
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

  describe 'betterplace API access' do
    let :api_request_url do
      "https://api.bp42.com/en/api_v4/projects/#{sin_project.betterplace_id}.json"
    end

    before do
      allow_any_instance_of(BetterplaceApi).to receive(:open).
        with(api_request_url, read_timeout: 10.seconds, open_timeout: 10.seconds).
        and_yield(StringIO.new(response))
    end

    context 'incorrect API response' do
      let :response do
        'NIX CORRECT'
      end

      it 'just reraise the excpetion adding the URL to the message' do
        expect { sin_project.betterplace_progress_percentage }.to\
          raise_error(JSON::ParserError, /#{api_request_url}/)
      end
    end

    context 'correct API response' do
      let :response do
        File.read(Rails.root + 'spec/assets/sin_project_response.json')
      end

      it 'fetches betterplace_description' do
        expect(sin_project.betterplace_description).to be_present
      end

      it 'fetches betterplace_progress_percentage' do
        expect(sin_project.betterplace_progress_percentage).to eq 95
      end

      it 'fetches betterplace_open_amount_in_cents' do
        expect(sin_project.betterplace_open_amount_in_cents).to eq 182738
      end
    end
  end
end
