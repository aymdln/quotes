class FinalClientRelation < ApplicationRecord
  belongs_to :relation
  belongs_to :final_client, class_name: 'ThirdParty'
  has_many :quotes
end
