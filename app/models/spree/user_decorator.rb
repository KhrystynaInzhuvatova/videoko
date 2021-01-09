module Spree
  module UserDecorator
    def self.prepended(base)
      base.has_many :offers, class_name: 'Spree::Offer',dependent: :destroy
    end

    Spree::User.prepend self
  end
end
