module Spree
  class HomeController < Spree::StoreController
    respond_to :html

    def index
      fresh_when etag: store_etag, last_modified: store_last_modified, public: true
      @tel = "(032)295-1-295"
      @email = "videoko@ukr.net"
    end
  end
end
