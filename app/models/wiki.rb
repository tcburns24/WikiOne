class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators

  extend FriendlyId
  friendly_id :title use: :slugged

  def downgrade
    self.update(private: false)
  end
end
