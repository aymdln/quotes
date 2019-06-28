class Quote < ApplicationRecord
  enum state: ["Brouillon", "En cours", "Validé", "Refusé"]
  belongs_to :relation
  belongs_to :final_client, class_name: "ThirdParty"
end