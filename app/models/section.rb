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
      value_max: self.value_max.nil? ? "" : self.value_max,
      value_calcul: self.value_calcul.nil? ? "" : self.value_calcul
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
    variable_max = self.max
    variable_calcul = self.calcul
    variable_max.value = self.value_max if variable_max.value != self.value_max && variable_max.value != nil
    variable_calcul.value = self.value_calcul if variable_calcul.value != self.value_calcul && variable_calcul.value != nil
    variable_max.save
    variable_calcul.save
  end
end