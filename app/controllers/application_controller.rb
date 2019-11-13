class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def links
    @links = [
      {
        name: "Clients",
        icon: "users",
        path: clients_path,
      },
      {
        name: "Devis",
        icon: "file-text",
        path: quotes_path,
      },
      {
        name: "Réglages",
        icon: "settings",
        path: "#",
      },
    ]
  end

  def manufacturer?
    current_user.third_party.manufacturer?
  end
  
end
