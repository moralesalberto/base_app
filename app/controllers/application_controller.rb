class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  protected

  def permission_denied
    render :template => 'shared/permission_denied.html.erb', :layout => 'public'
  end
end
