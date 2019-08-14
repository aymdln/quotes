class ClientsController < ApplicationController
  def index
    links
    if manufacturer?
      relations = current_user.third_party.relations_as_manufacturer
      @clients = relations.map do |relation|
        relation.client
      end
    else
    end
  end

  def show
    links
    @client = ThirdParty.find(params[:id])
    if @client.manufacturer?
      relation = @client.relations_as_manufacturer
      @quotes = Quote.where(relation_id: relation.ids)
    else
      relation = @client.relations_as_client
      @quotes = Quote.where(relation_id: relation.ids)
    end
  end

  private

  def client_params
    params.require(:client).permit!
  end
end
