class ClientsController < ApplicationController
  def index
    policy_scope(ThirdParty)
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
    authorize @client
    if @client.manufacturer?
      relation = @client.relations_as_manufacturer.first.final_client_relations
      @quotes = Quote.where(final_client_relation_id: relation.ids)
    else
      relation = @client.relations_as_client.first.final_client_relations
      @quotes = Quote.where(final_client_relation_id: relation.ids)
    end
    # raise
  end
  
  def new
    links
    @client = ThirdParty.new
  end

  def create
    links
    @client = ThirdParty.new(client_params)
    @client.third_party_type = 1
    if @client.save(
      name: @client.name,
      address: @client.address,
      city: @client.city,
      zip: @client.zip,
      country: @client.country,
      email: @client.email,
      phone: @client.phone,
      siret: @client.siret,
      siren: @client.siren,
    )
    relation = Relation.create(manufacturer_id: current_user.third_party.id, client_id: @client.id)
      redirect_to clients_path
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:third_party).permit!
  end
end
