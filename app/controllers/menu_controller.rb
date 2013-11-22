class MenuController < ApplicationController
  def index
  end
  def change_locale
    I18n.locale = params[:language]
    render :js => "window.location = '" + menu_index_path + "'"
  end
end
