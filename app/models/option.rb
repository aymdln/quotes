class Option < ApplicationRecord
  enum option_type: [:dimension, :color]
end
