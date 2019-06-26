class ThirdParty < ApplicationRecord
    enum third_party_type: [:manufacturer, :client, :end_client]
    has_many :users
end