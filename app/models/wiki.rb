class Wiki < ApplicationRecord
  belongs_to :user

  def downgrade
    self.update(private: false)
  end
end
