class Property < ApplicationRecord
  attr_accessor :value_packing
  attr_accessor :value_conso

  before_create :create_variable
  before_update :update_variable

  belongs_to :packing, class_name: 'Variable', required: false
  belongs_to :conso, class_name: 'Variable', required: false

  has_many :color_propreties_dependant
  has_many :glazing_propreties_dependant
  
  monetize :price_cents

  private

  def create_variable

    attributes = {
      value_packing: self.value_packing.nil? ? "" : self.value_packing,
      value_conso: self.value_conso.nil? ? "" : self.value_conso
    }
    attributes.each do |key,value|
      if value.nil? == false
        variable = Variable.create(
          product_id: self.product_id,
          name: "propriété_#{self.name.gsub(" ", "_")}_#{key.to_s.gsub("value_", "")}",
          value: value
        )
      end
      self.packing_id = variable.id if key == :value_packing
      self.conso_id = variable.id if key == :value_conso

    end
  end

  def update_variable
    variable_packing = self.packing
    variable_conso = self.conso

    variable_packing.value = self.value_packing if variable_packing.value != self.value_packing && variable_packing.value != nil
    variable_conso.value = self.value_conso if variable_conso.value != self.value_conso && variable_conso.value != nil
    
    variable_packing.save
    variable_conso.save

  end

end
