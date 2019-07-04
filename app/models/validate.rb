def third_party_maker
  unless ThirdParty.find(self.third_party.id).manufacturer?
    errors.add(:third_party_id, "This is not a manufacturer")
  end
end


