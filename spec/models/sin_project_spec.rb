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

    context 'incorrect API response' do
      it 'just reraise the excpetion adding the URL to the message' do
        response = 'NIX CORRECT'
        WebMock.stub_request(:get, api_request_url).to_return(
          status: 200, body: response)
        expect { sin_project.betterplace_progress_percentage }.to\
          raise_error(JSON::ParserError, /#{api_request_url}/)
      end
    end

    context 'correct API response' do
      before do
        response = %q{ {"id":1114,"created_at":"2009-03-10T10:12:16Z","updated_at":"2013-09-18T00:08:32Z","latitude":34.531617284782,"longitude":69.13581752939456,"street":"Taimani, behind Qasemi Winhouse","zip":"","city":"Kabul","country":"Afghanistan","title":"Skateistan Afghanistan","description":"With 68% of Afghanistan\u2019s population under the age of 25, Skateistan strongly believes that youth are the ones most capable of bringing about social change.<br /><br />Skateistan is an Afghan NGO which operates Afghanistan\u2019s (and the world\u2019s) first co-educational skateboarding school. The Skateistan school engages nearly 400 Kabul youth weekly through skateboarding, and provides them with new opportunities in cross-cultural interaction, education, and personal empowerment programs. <br /><br />The students (ages 5-17) come from all of Afghanistan\u2019s diverse ethnic and socioeconomic backgrounds, and include 40% female students, hundreds of streetworking children, and youth with disabilities. They develop skills in skateboarding, leadership, problem-solving, multimedia, and creative arts. The students themselves decide what they want to learn; we connect them with a safe space and opportunities for them to develop the skills that they consider important.<br /><br />For Afghan girls Skateistan's programming is especially important as there are very few recreational opportunities for females. For example, it is not culturally acceptable for girls in Afghanistan to ride bicycles or play sports in public. <br /><br />Skateistan has been active in Kabul since 2007 - with our facility built in 2009 - and in that time we\u2019ve seen that Afghan youth of all ethnicities, genders, and socioeconomic backgrounds love to skateboard. Skateistan brings them together, equipping young men and women to lead their communities toward social change and development.<br /><br />In 2012 Skateistan will be opening its second Afghan facility in Mazar-e-Sharif, Northern Afghanistan. It will have space to teach up to 1000 youth weekly.<br /><br />Our program gives hundreds of oppressed youth a voice. Education and the opportunity for self-expression can break the cycles of poverty, illiteracy and exclusion, with sport paving the way.","tax_deductible":true,"open_amount_in_cents":182738,"positive_opinions_count":577,"negative_opinions_count":0,"donor_count":478,"progress_percentage":95,"incomplete_need_count":1,"completed_need_count":78,"blog_post_count":72,"contact":{"name":"E. Kinast","links":[{"rel":"platform","href":"http://www.bp42.com/en/users/erika_k2"}]},"carrier":{"name":"Skateistan","picture":{"links":[{"rel":"original","href":"https://asset1.bp42.com/assets/default/default_collective-2005453a6247348495bae48a02e70d18.jpg"},{"rel":"large_attention_deprecated","href":"https://asset1.bp42.com/assets/default/default_collective-2005453a6247348495bae48a02e70d18.jpg"},{"rel":"profile_attention_deprecated","href":"https://asset1.bp42.com/assets/default/profile_collective-2005453a6247348495bae48a02e70d18.jpg"},{"rel":"thumb_attention_deprecated","href":"https://asset1.bp42.com/assets/default/thumb_collective-528812f2d74f221c6abeeccabbabe224.jpg"}]},"links":[{"rel":"self","href":"https://api.bp42.com/en/api_v4/organisations/1054.json"}]},"profile_picture":{"links":[{"rel":"original","href":"https://asset1.bp42.com/paperclip/000/289/158/default_girls-merza-sm.jpg"},{"rel":"large_attention_deprecated","href":"https://asset1.bp42.com/paperclip/000/289/158/default_girls-merza-sm.jpg"},{"rel":"profile_attention_deprecated","href":"https://asset1.bp42.com/paperclip/000/289/158/profile_girls-merza-sm.jpg"},{"rel":"thumb_attention_deprecated","href":"https://asset1.bp42.com/paperclip/000/289/158/thumb_girls-merza-sm.png"}]},"links":[{"rel":"self","href":"https://api.bp42.com/en/api_v4/projects/1114.json"},{"rel":"platform","href":"http://www.bp42.com/en/projects/1114-skateistan-afghanistan"},{"rel":"opinions","href":"https://api.bp42.com/en/api_v4/projects/1114/opinions.json"},{"rel":"pictures","href":"https://api.bp42.com/en/api_v4/projects/1114/pictures.json"},{"rel":"needs","href":"https://api.bp42.com/en/api_v4/projects/1114/needs.json"},{"rel":"blog_posts","href":"https://api.bp42.com/en/api_v4/projects/1114/blog_posts.json"}]} }
        WebMock.stub_request(:get, api_request_url).to_return(
          status: 200, body: response)
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
