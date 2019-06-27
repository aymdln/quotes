class Relation < ApplicationRecord
  belongs_to :manufacturer, class_name: 'ThirdParty'
  belongs_to :client, class_name: 'ThirdParty'
end