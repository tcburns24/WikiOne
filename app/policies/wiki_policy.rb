class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    true
  end

  def index?
    true
  end

  def update?
    if wiki.private?
      user == wiki.user
    else
      user.present?
    end
  end

  def show?
    if wiki.private?
      wiki.user == user
    else
      true
    end
  end

  def new?
    true
  end

  def edit?
    if wiki.private?
      user == wiki.user
    else
      user.present?
    end
  end

  def destroy?
    user.is_admin? || wiki.user == user
  end

end
