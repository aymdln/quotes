class Section < ApplicationRecord
  attr_accessor :value_max
  attr_accessor :value_calcul
  before_create :create_variable
  before_update :update_variable

  belongs_to :option
  belongs_to :option_dimension
  belongs_to :max, class_name: 'Variable', required: false
  belongs_to :calcul, class_name: 'Variable', required: false
  
  private
  
  def create_variable
    attributes = {
      value_max: self.value_max,
      value_calcul: self.value_calcul
    }
    attributes.each do |key,value|
      if value.nil? == false
        variable = Variable.create(
          product_id: self.option.product_id,
          name: "section_#{key}",
          value: value
        )
      end
      self.max_id = variable.id if key == :value_max
      self.calcul_id = variable.id if key == :value_calcul
    end
  end
  
  def update_variable
    variable = self.dimension
    variable.name = self.name if variable.value != self.name && variable.name != nil
    variable.value = self.value if variable.value != self.value && variable.value != nil
    variable.save
  end
end