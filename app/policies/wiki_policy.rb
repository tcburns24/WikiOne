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

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.roles == 'admin'
        wikis = scope.all
      elsif user.roles == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private || wiki.owner == user || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
