class Product < ApplicationRecord

  CATEGORIES = %w(otc prescription restricted)

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :category,
    presence: true,
    inclusion: {
      in: CATEGORIES,
      message: "%{value} is not a valid category"
    }
end
