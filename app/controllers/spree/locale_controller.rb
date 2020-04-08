module Spree
  class LocaleController < Spree::StoreController
    skip_before_action :verify_authenticity_token
    def index
      render :index, layout: false
    end

    def set
      redirect_to root_path(locale: params[:switch_to_locale])
    end
  end
end
