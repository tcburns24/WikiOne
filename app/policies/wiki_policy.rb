class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
  end

  def update?
    user.admin?
  end

  def index?
  end

  def show?
  end

  def new?
  end

  def edit?
    user.admin?
  end

  def delete?
    user.admin?
  end

end
