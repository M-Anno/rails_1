class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
  
  def index
    @q = Room.ransack(params[:q])
  end
  
  def search
    @q = Room.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def after_sign_in_path_for(resource)
    root_path
  end
  
  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
    
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
