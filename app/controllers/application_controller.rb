class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_locale

  # set locale information to all links
  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  # enable change locale by url
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
