require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:wiki) }

  describe "attributes" do
    it "has a user_id and a wiki_id" do
      expect(collaborator).to have_attributes(wiki_id: wiki.id, user_id: user.id)
    end
  end
end
