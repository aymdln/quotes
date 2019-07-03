class Product < ApplicationRecord
  enum category: ["puit de lumière"]
  validates :third_party_id, :category, :name, presence: true
  belongs_to :third_party
  has_many :quote_produts

  validate :third_party_maker

  def third_party_maker
    unless ThirdParty.find(self.third_party.id).manufacturer?
      errors.add(:third_party_id, "This is not a manufacturer")
    end
  end

end