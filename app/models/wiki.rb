class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators

  include FriendlyId
  friendly_id :title, use: :slugged

  def downgrade
    self.update(private: false)
  end
end
