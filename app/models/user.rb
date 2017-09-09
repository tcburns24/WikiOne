class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborators
  after_initialize :set_role

  def downgrade
    self.remove_role :premium
  end

  private

  def set_role
    self.add_role :standard
  end
end
