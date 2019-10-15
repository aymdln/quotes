class OptionDimension < ApplicationRecord
  attr_accessor :value
  before_validation :create_variable
  # before_save :create_variable


  belongs_to :dimension, class_name: 'Variable'
  belongs_to :option
  has_many :sections

  private

  def create_variable
    variable = Variable.new(
      product_id: self.option.product_id,
      name: self.name,
      value: self.value
    )
    self.dimension_id = variable.id
  end
  
end
