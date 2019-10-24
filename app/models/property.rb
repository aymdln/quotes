class Property < ApplicationRecord
  attr_accessor :value_packing
  attr_accessor :value_conso
  attr_accessor :value_quantity
  attr_accessor :value_order

  belongs_to :packing, class_name: 'Variable', required: false
  belongs_to :conso, class_name: 'Variable', required: false
  belongs_to :quantity, class_name: 'Variable', required: false
  belongs_to :order, class_name: 'Variable', required: false

  has_many :color_propreties_dependant
  has_many :glazing_propreties_dependant
  
  monetize :price_cents

  private

  def create_variable

    attributes = {
      value_packing: self.value_packing.nil? ? "" : self.value_packing,
      value_conso: self.value_conso.nil? ? "" : self.value_conso,
      value_quantity: self.value_quantity.nil? ? "" : self.value_quantity,
      value_order: self.value_order.nil? ? "" : self.value_order
    }
    attributes.each do |key,value|
      if value.nil? == false
        variable = Variable.create(
          product_id: self.option.product_id,
          name: "section_#{key}",
          value: value
        )
      end
      self.packing_id = variable.id if key == :value_packing
      self.conso_id = variable.id if key == :value_conso
      self.quantity_id = variable.id if key == :value_quantity
      self.order_id = variable.id if key == :value_order
    end
  end

  def update_variable
    variable_packing = self.packing
    variable_conso = self.conso
    variable_quantity = self.quantity
    variable_order = self.order

    variable_packing.value = self.value_packing if variable_packing.value != self.value_packing && variable_packing.value != nil
    variable_conso.value = self.value_conso if variable_conso.value != self.value_conso && variable_conso.value != nil
    variable_quantity.value = self.value_quantity if variable_quantity.value != self.value_quantity && variable_quantity.value != nil
    variable_order.value = self.value_order if variable_order.value != self.value_order && variable_order.value != nil
    
    variable_packing.save
    variable_conso.save
    variable_quantity.save
    variable_order.save
  end

end
