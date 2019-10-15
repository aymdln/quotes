class Option < ApplicationRecord
  enum option_type: [:dimension, :color, :glazing, :section]
  has_many :sections
  has_many :option_colors
  has_many :option_glazings
  has_many :option_dimensions
  has_many :option_results
  belongs_to :product


end
