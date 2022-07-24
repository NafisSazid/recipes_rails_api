class Category < ApplicationRecord
  include ConstantValidatable

  # jitera-anchor-dont-touch: relations

  has_many :recipes, dependent: :destroy

  has_many :ingredients, through: :recipes

  # jitera-anchor-dont-touch: enum

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :description, length: { maximum: 65_535, minimum: 0, message: I18n.t('.out_of_range_error') },
                          allow_nil: true

  accepts_nested_attributes_for :recipes

  def self.associations
    [:recipes]
  end

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
