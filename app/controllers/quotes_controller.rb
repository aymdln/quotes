class QuotesController < ApplicationController
  def index
    links
    if current_user.third_party.manufacturer?
      relations = current_user.third_party.relations_as_manufacturer
    else
      relations = current_user.third_party.relations_as_client
    end
    @quotes = relations.map do |relation|
      Quote.where(relation_id: relation.id)
    end
    @quotes.flatten!
  end

  private

  def links
    @links = [
      {
        name: "Clients",
        icon: "fa fa-user",
        path: "#",
      },
      {
        name: "Devis",
        icon: "fa fa-file-alt",
        path: "#",
      },
      {
        name: "Réglages",
        icon: "fa fa-cog",
        path: "#",
      },
    ]
  end
end
