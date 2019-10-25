class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  REGEX = /\{{(.*?)\}}/

  def calcul_variable(options, variables_product)
    variables_ok = []
    create_variables_array(options, variables_product)
    byebug
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
  end

  private

  def create_variables_array(options, variables_product)
    variables = []
    options.each do |option|
      if option.option_type_before_type_cast == 0
        option_dimensions = option.option_dimensions
        option_dimensions.each do |option_dimension|
          variables << option_dimension.dimension
        end
      end
    end
    byebug
    variables_product.each do |variable|
      byebug
      variables << variable if variables.include?(variable) == false
      byebug
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
