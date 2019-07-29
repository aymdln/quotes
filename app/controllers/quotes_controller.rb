class QuotesController < ApplicationController

  def index
    links
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
      }
    ]
  end
end
