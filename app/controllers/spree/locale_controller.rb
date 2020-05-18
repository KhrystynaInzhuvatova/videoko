module Spree
  class LocaleController < Spree::StoreController
    skip_before_action :verify_authenticity_token

    def index
      render :index, layout: false
    end

    def set
      locale = params[:switch_to_locale] || I18n.default_locale
      I18n.locale = Spree::Frontend::Config[:locale] = locale
      redirect_to root_path(locale: params[:switch_to_locale])
    end
  end
end
