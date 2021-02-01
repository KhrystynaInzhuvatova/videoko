module Spree
  module UserDecorator
    def self.prepended(base)
      base.has_many :offers, class_name: 'Spree::Offer',dependent: :destroy
      base.has_one :mutual_settlement, class_name: 'Spree::MutualSettlement'
    end

    def full_name
      if self.first_name.nil? && self.last_name.nil?
        result = self.login
      elsif self.first_name.nil? && !self.last_name.nil?
        result = self.last_name
      elsif !self.first_name.nil? && self.last_name.nil?
        result =self.first_name
      elsif !self.first_name.nil? && !self.last_name.nil?
       result = "#{self.first_name}" +" "+ "#{self.last_name}"
     end
    end

    Spree::User.prepend self
  end
end
