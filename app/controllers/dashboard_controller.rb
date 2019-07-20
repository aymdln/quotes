class DashboardController < ApplicationController
  def index
    
    links

    if current_user.third_party.manufacturer?
      @quotes = current_user.third_party.relations_as_manufacturer.map do |relation|
        relation.quotes
      end
    end
  end

  private

  def links
    @links = [
      {
        name: "Home",
        icon: "fa fa-home",
        path: "#",
      },
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
    ]
  end
  
end
