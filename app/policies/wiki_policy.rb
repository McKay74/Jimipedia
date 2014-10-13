class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
   user.role == "premium"
  end
end
