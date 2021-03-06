class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role == "premium"
        scope.all
      else
        scope.where(:private => false)
      end
    end
  end

  def index?
    true
  end

  def show?
    user.role == "premium" || record.collaborators.pluck(:user_id).include?(user.id)
  end

  def private?
   user.role == "premium"
  end
end
