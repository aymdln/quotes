class QuotesController < ApplicationController
  def index
    links
    if current_user.third_party.manufacturer?
      relations = current_user.third_party.relations_as_manufacturer
      @quotes = relations.map do |relation|
        Quote.where(relation_id: relation.id, state: [1,2,3])
      end
    else
      relations = current_user.third_party.relations_as_client
    end
    @quotes.flatten!
  end

  def show
    links
  end

end
