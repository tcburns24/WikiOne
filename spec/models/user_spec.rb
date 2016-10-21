require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user, email: "myuser@gmail.com") }
  let(:wiki) { FactoryGirl.create(:wiki, user: user) }

  it { is_expected.to have_many(:wikis) }
  it { is_expected.to have_many(:collaborators) }

  describe "attributes" do
    it "has email" do
      expect(user).to have_attributes(email: user.email)
    end
  end
end
