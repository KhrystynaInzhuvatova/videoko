module Spree
  class Volume < Spree::Base

  belongs_to :product, class_name: "Spree::Product"
  has_many_attached :images
  validates :images, attached: true, dimension: { width: { min: 800, max: 1700 }, height: { min: 600, max: 1100  }  }

  def volume_image_resize
    pictures = self.images.map{|c|c.variant(resize: "800X600").processed}
    pictures.sort_by{|c|c.filename.base.to_i}
  end

  end
end
