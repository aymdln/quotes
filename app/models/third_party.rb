class ThirdParty < ApplicationRecord
    enum third_party_type: [:manufacturer, :client, :end_client]
    has_many :users
    has_many :relations_as_manufacturer, class_name: 'Relation', foreign_key: 'manufacturer_id'
    has_many :relations_as_client, class_name: 'Relation', foreign_key: 'client_id'
end