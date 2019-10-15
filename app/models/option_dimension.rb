class OptionDimension < ApplicationRecord
  attr_accessor :value
  before_create :create_variable
  before_update :update_variable

  belongs_to :dimension, class_name: 'Variable', required: false
  belongs_to :option
  has_many :sections



  private

  def create_variable
    variable = Variable.create(
      product_id: self.option.product_id,
      name: self.name,
      value: self.value
    )
    self.dimension_id = variable.id
  end

  def update_variable
    variable = self.dimension
    variable.name = self.name if variable.value != self.name && variable.name != nil
    variable.value = self.value if variable.value != self.value && variable.value != nil
    variable.save
  end
  
  
end
