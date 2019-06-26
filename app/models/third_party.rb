class ThirdParty < ApplicationRecord
    enum type: [:manufacturer, :client, :end_client ]
    has_many :users
end