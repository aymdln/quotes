class Section < ApplicationRecord
  attr_accessor :value_max
  attr_accessor :value_calcul
  before_create :create_variable
  before_update :update_variable

  belongs_to :option
  belongs_to :option_dimension
  belongs_to :max, class_name: 'Variable'
  belongs_to :calcul, class_name: 'Variable'
  
  private
  
  def create_variable
    attributes = self.attributes
    attributes.each do |key,value|
      if key == :value_max || key == :value_calcul && value.nil? != true
        variable = Variable.create(
          product_id: self.option.product_id,
          name: "section_#{key.to_s}",
          value: value
        )
      end
      self.max = variable if key == :value_max
      self.calcul = variable if key == :value_calcul
    end
  end
  
  def update_variable
    variable = self.dimension
    variable.name = self.name if variable.value != self.name && variable.name != nil
    variable.value = self.value if variable.value != self.value && variable.value != nil
    variable.save
  end
end