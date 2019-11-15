class QuotesController < ApplicationController
  def index
    policy_scope(Quote)
    links
    if manufacturer?
      relations = current_user.third_party.relations_as_manufacturer
      final_client_relations = FinalClientRelation.where(relation: relations)
      @quotes = Quote.where(final_client_relation: final_client_relations, status: [1,2,3]).order(:id)
    else
      relations = current_user.third_party.relations_as_client
    end
  end

  def show
    links
    @quote = Quote.find(params[:id])
  end

  private

  def client_params
    params.require(:client).permit!
  end

end
