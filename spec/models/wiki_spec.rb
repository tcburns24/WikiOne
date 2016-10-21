require 'rails_helper'

RSpec.describe Wiki, type: :model do

  let(:user) { FactoryGirl.create(:user, email: "myuser@gmail.com") }
  let(:wiki) { FactoryGirl.create(:wiki, user: user) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:collaborators) }

  describe "attributes" do
    it "has title, body, user_id, and private" do
      expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user_id: user.id, private: false)
    end
  end
end
