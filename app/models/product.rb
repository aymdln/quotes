require "validate"
class Product < ApplicationRecord
  enum category: ["puit de lumière"]
  validates :third_party_id, :category, :name, presence: true
  belongs_to :third_party
  has_many :quote_produts
  has_many :relation_coefs
  has_many :options
  has_many :variables
  
  validate :third_party_maker

  REGEX = /\{{(.*?)\}}/

  def calcul_variable(largeur, rampant)
    variables = []
    variables_ok = []
    self.variables.each do |variable|
      
      if variable.name == "largeur"
        variables << {
          name: variable.name,
          token: variable.token,
          value: largeur,
          result: ""
        }
      elsif variable.name == "rampant"
        variables << {
          name: variable.name,
          token: variable.token,
          value: rampant,
          result: ""
        }
      else
        variables << {
          name: variable.name,
          token: variable.token,
          value: variable.value,
          result: ""
        }
      end
    end
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