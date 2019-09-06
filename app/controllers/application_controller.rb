class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def links
    @links = [
      {
        name: "Clients",
        icon: "fa fa-user",
        path: clients_path,
      },
      {
        name: "Devis",
        icon: "fa fa-file-alt",
        path: quotes_path,
      },
      {
        name: "Réglages",
        icon: "fa fa-cog",
        path: "#",
      },
    ]
  end

  def manufacturer?
    current_user.third_party.manufacturer?
  end
  
end
