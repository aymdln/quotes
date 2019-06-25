class ThirdParty < ApplicationRecord
    enum type: [:manufacturer, :client, :end_client ]
end