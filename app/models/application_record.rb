class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  REGEX = /\{{(.*?)\}}/

  def calcul_variable(options, variables_product)
    variables_ok = []
    variables = create_variables_array(options, variables_product)
    until variables.empty?
      variables.each do |variable|
        while value_variable?(variable)
          match, value = extract_variable_2(variable, variables_ok)
          break if value.nil?
          remplace_variable(variable, value, match)
        end
        if value_variable?(variable)
          variables.delete(variable)
          variables << variable
          break
        end
        variable[:result] = eval(variable[:value]).to_f.to_s
        variables_ok << variable
        variables.delete(variable)
        break
      end
    end
    variables_ok
  end

  def calcul_price(options, product_id)
    variables_product = Variable.where(product_id: product_id)
    variables_ok = calcul_variable(options, variables_product)
    p variables_ok
    properties = Property.where(product_id: product_id)
    properties_data = []
    price_total = 0.0
    properties.each do |property|
      conso = (variables_ok.select { |variable| variable[:token] == property.conso.token }).first
      packing = (variables_ok.select { |variable| variable[:token] == property.packing.token }).first
      p conso[:name]
      p conso[:result]
      p packing[:result]
      quantity = conso[:result].to_f/packing[:result].to_f
      quantity = quantity.ceil if property.order_exact_quantity == false
      p quantity
      price = quantity*(property.price_cents*0.01)
      p price
      price_total += price
    end
    price_total
  end

  private

  def create_variables_array(options, variables_product)
    variables = []
    options.each do |option|
      variables << option
    end
    variables_product.each do |variable|
      variable_data = {
        name: variable.name,
        token: variable.token,
        value: variable.value,
        result: ""
      }
      variables << variable_data if (options.select {|option| option[:token] == variable.token }).empty?
    end
    variables
  end
  

  def value_variable?(variable)
    variable[:value].match?(REGEX)
  end
  
  def remplace_variable(variable, value, match)
    variable[:value][match[0]] = value[:result]
  end
  
  def extract_variable_2(variable, variables_ok)
    match = variable[:value].match(REGEX)
    value = variables_ok.select { |v| v[:token] == match[1] }
    value = value[0]
    return match, value
  end


end
