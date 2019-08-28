# frozen_string_literal: true
class CartsControllerPolicy
  def initialize(_user, _ctrlr); end

  def add_to
    true
  end

  def remove_from
    true
  end

  def remove_multiple_from
    true
  end
end