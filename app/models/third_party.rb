class ThirdParty < ApplicationRecord
    enum third_party_type: [:manufacturer, :client, :final_client]
    has_many :users
    has_many :relations_as_manufacturer, class_name: 'Relation', foreign_key: 'manufacturer_id'
    has_many :relations_as_client, class_name: 'Relation', foreign_key: 'client_id'
    has_many :quotes_as_final_client, class_name: 'Quote', foreign_key: 'final_client_id'
    validates :name, presence: :true
end