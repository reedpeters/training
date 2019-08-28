# frozen_string_literal: true
class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # attr_reader :user, :scope
    #
    # def initialize(user, scope)
    #   @user  = user
    #   @scope = scope
    # end

    def resolve
      if user&.admin?
        scope.all
      else
        scope.published
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user&.admin?
  end

  def update?
    user&.admin?
  end

  def destroy?
    user&.admin?
  end
end