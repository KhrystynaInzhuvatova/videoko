module Spree
  class ProductsController < Spree::StoreController
    include Spree::ProductsHelper
    include Spree::FrontendHelper

    before_action :load_product, only: [:show, :related]
    before_action :load_taxon, only: :index

    respond_to :html

    def index
      @taxon_id = params[:taxon_id]
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products

      last_modified = @products.maximum(:updated_at)&.utc if @products.respond_to?(:maximum)

      etag = [
        store_etag,
        last_modified&.to_i,
        available_option_types_cache_key(@taxon_id),
        filtering_params_cache_key(@taxon_id)
      ]

      fresh_when etag: etag, last_modified: last_modified, public: true
    end

    def show
      redirect_if_legacy_path

      @taxon = params[:taxon_id].present? ? Spree::Taxon.find(params[:taxon_id]) : @product.taxons.first

      if !@product.related.nil?
      related = @product.related.tr('["\"]','').split(',').reject { |c| c.empty? }.map(&:to_i).reject { |c| c == 0 }
      @related_products = related.map{|c| Spree::Product.find(c) }
      end
      load_variants

      #if stale?(etag: product_etag, last_modified: @product.updated_at.utc, public: true)

        @product_summary = Spree::ProductSummaryPresenter.new(@product).call
        @product_properties = @product.product_properties.includes(:property)

        case_price = !spree_current_user.nil?  ? spree_current_user.spree_roles.last.name : :rozdrib

        case case_price
        when "admin"
          @role_id = Spree::Role.find_by(name: :vip2).id
          @product_price = !default_variant(@variants, @product).price_in(current_currency,@role_id).nil? ? default_variant(@variants, @product).price_in(current_currency,@role_id).amount : 0
          if @product_price > 0
          @other_price = [
            ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :rozdrib).id).amount, unit: "₴", separator: ".", delimiter: ""),
            ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :opt).id).amount, unit: "₴", separator: ".", delimiter: "")
          ]
        else
          @other_price = []
        end
          when "opt"
            @role_id = Spree::Role.find_by(name: :opt).id
            @product_price = !default_variant(@variants, @product).price_in(current_currency,@role_id).nil? ? default_variant(@variants, @product).price_in(current_currency,@role_id).amount : 0
            if @product_price > 0
              @other_price = [
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :rozdrib).id).amount, unit: "₴", separator: ".", delimiter: "")
            ]
          else
            @other_price = []
          end
          when "gold"
            @role_id = Spree::Role.find_by(name: :gold).id
            @product_price = !default_variant(@variants, @product).price_in(current_currency,@role_id).nil? ? default_variant(@variants, @product).price_in(current_currency,@role_id).amount : 0
            if @product_price > 0
            @other_price = [
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :rozdrib).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :opt).id).amount, unit: "₴", separator: ".", delimiter: "")
            ]
          else
            @other_price = []
          end
          when "vip"
            @role_id = Spree::Role.find_by(name: :vip).id
            @product_price = !default_variant(@variants, @product).price_in(current_currency,@role_id).nil? ? default_variant(@variants, @product).price_in(current_currency,@role_id).amount : 0
            if @product_price > 0
            @other_price = [
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :rozdrib).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :opt).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :gold).id).amount, unit: "₴", separator: ".", delimiter: "")
            ]
          else
            @other_price = []
          end
          when "vip2"
            @role_id = Spree::Role.find_by(name: :vip2).id
            @product_price = !default_variant(@variants, @product).price_in(current_currency,@role_id).nil? ? default_variant(@variants, @product).price_in(current_currency,@role_id).amount : 0
            if @product_price > 0
            @other_price = [
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :rozdrib).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :opt).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :gold).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :vip).id).amount, unit: "₴", separator: ".", delimiter: "")
            ]
          else
            @other_price = []
          end
          when "vip1"
            @role_id = Spree::Role.find_by(name: :vip1).id
            @product_price = !default_variant(@variants, @product).price_in(current_currency,@role_id).nil? ? default_variant(@variants, @product).price_in(current_currency,@role_id).amount : 0
            if @product_price > 0
            @other_price = [
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :rozdrib).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :opt).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :gold).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :vip).id).amount, unit: "₴", separator: ".", delimiter: ""),
              ActionController::Base.helpers.number_to_currency(default_variant(@variants, @product).price_in(current_currency,Spree::Role.find_by(name: :vip2).id).amount, unit: "₴", separator: ".", delimiter: ""),
            ]
          else
            @other_price = []
          end
          else
            @role_id = Spree::Role.find_by(name: :rozdrib).id
            @product_price = !default_variant(@variants, @product).price_in(current_currency,@role_id).nil? ? default_variant(@variants, @product).price_in(current_currency,@role_id).amount : 0
            @other_price = []
          end

        @product_images = product_images(@product, @variants)

      #end

    end

    #def related
      #related = @product.related.tr('["\"]','').split(',').reject { |c| c.empty? }.map(&:to_i)
      #@related_products = related.map{|c| Spree::Product.find(c)}

      #if @related_products.any?
        #render template: 'spree/products/related', layout: false
      #else
        #head :no_content
      #end
    #end

    private

    def accurate_title
      if @product
        @product.meta_title.blank? ? @product.name : @product.meta_title
      else
        super
      end
    end

    def load_product
      @products = if try_spree_current_user.try(:has_spree_role?, 'admin')
                    Product.with_deleted
                  else
                    Product.active(current_currency).where(show:true)
                  end

      @product = @products.includes(:master).
                 friendly.
                 find(params[:id])
    end

    def load_taxon
      @taxon = Spree::Taxon.find(params[:taxon]) if params[:taxon].present?
    end

    def load_variants
      @variants = @product.
                  variants_including_master.
                  spree_base_scopes.
                  active(current_currency).
                  includes(
                    #prices: prices,
                    option_values: [:option_value_variants],
                    images: { attachment_attachment: :blob }
                  )

    end

    def redirect_if_legacy_path
      # If an old id or a numeric id was used to find the record,
      # we should do a 301 redirect that uses the current friendly id.
      if params[:id] != @product.friendly_id
        params[:id] = @product.friendly_id
        params.permit!
        redirect_to url_for(params), status: :moved_permanently
      end
    end

    def product_etag
      [
        store_etag,
        @product,
        @taxon,
        @product.possible_promotion_ids,
        @product.possible_promotions.maximum(:updated_at),
      ]
    end
  end
end
