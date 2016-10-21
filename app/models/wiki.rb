class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators

  def downgrade
    self.update(private: false)
  end
end
