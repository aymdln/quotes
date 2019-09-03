class HomeController < ActionController::Base

  def index
    redirect_to clients_path
  end

end