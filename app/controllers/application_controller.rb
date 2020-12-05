class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def configure_permitted_parameters
    added_attrs = [ :nickname, :email, :password , :last_name, :first_name, :last_name_furigana, :first_name_furigana, :birth_date]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
  
  def set_item_search_query
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end
end
