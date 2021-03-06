module Spree
  class OptionType < Spree::Base
    acts_as_list

  default_scope {includes(:translations)}
    with_options dependent: :destroy, inverse_of: :option_type do
      has_many :option_values, -> { order(:position) }
      has_many :product_option_types
    end

    belongs_to :taxon
    has_many :products, through: :product_option_types

    has_many :option_type_prototypes, class_name: 'Spree::OptionTypePrototype'
    has_many :prototypes, through: :option_type_prototypes, class_name: 'Spree::Prototype'

    with_options presence: true do
      validates :name#, uniqueness: { case_sensitive: false, allow_blank: true }
      validates :presentation
      validates :taxon_id
    end

    default_scope { order(:position) }
    default_scope{includes(:translations)}
    accepts_nested_attributes_for :option_values, reject_if: ->(ov) { ov[:name].blank? || ov[:presentation].blank? }, allow_destroy: true

    after_touch :touch_all_products

    def filter_param
      presentation.titleize.delete(' ').downcase
    end

    private

    def touch_all_products
      products.update_all(updated_at: Time.current)
    end
  end
end
