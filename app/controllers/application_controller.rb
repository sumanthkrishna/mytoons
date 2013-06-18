class ApplicationController < ActionController::Base
 helper_method :redirect_to
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
