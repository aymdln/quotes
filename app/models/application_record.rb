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
