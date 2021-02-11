class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :set_global_params

  protected

  def layout_by_resource
    devise_controller? ? "#{resource_class.to_s.downcase}_devise"
    : "application"
  end

  def set_global_params
    $global_params = params
  end
end
