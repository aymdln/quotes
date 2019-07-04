class Relation < ApplicationRecord
  belongs_to :manufacturer, class_name: 'ThirdParty'
  belongs_to :client, class_name: 'ThirdParty'
  has_many :quotes

  validate :third_party_maker, :third_party_client


  private

  def third_party_maker
    unless ThirdParty.find(self.manufacturer.id).manufacturer?
      errors.add(:manufacturer_id, "This is not a manufacturer")
    end
  end

  def third_party_client
    unless ThirdParty.find(self.client.id).client?
      errors.add(:client_id, "This is not a client")
    end
  end
  
end