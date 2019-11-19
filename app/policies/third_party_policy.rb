class ThirdPartyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def show?
    true
  end

  def edit?
    current_third_party = user.third_party
    if current_third_party.third_party_type == "manufacturer"
      Relation.exists?(manufacturer_id: current_third_party.id, client_id: record.id)
    else

    end
  end
  
  
end
