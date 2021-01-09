class OfferPdf < Prawn::Document
  def initialize(offer)
    super()
    font_setup
    @offer = offer
    #header
    table_content
    text_content
  end

  def font_setup
    font_families.update("SourceSansPro" => {
      :bold => "vendor/assets/fonts/SourceSansPro-Bold.ttf",
      :normal => "vendor/assets/fonts/SourceSansPro-Regular.ttf",
    })
    font "SourceSansPro"
  end

  def header
    image "#{Rails.root}/app/assets/images/homepage/logo.png", width: 530, height: 150
  end

  def item_header
    ["#{Spree.t('name')}", "#{Spree.t('price')}", "#{Spree.t('quantity')}"]
  end

  def item_header_summary
    ["","#{Spree.t('total_price')}", "#{Spree.t('currency')}"]
  end

  def item_rows
    @offer.offer_items.map do |product|
   [product.variant.product.name, product.price, product.quantity]
    end
  end

  def item_rows_summary
    [["",@offer.total_price, @offer.currency]]
  end

  def item_table_data
    [item_header, *item_rows] +
    [item_header_summary, *item_rows_summary]
  end

  def table_content
    table(item_table_data) do
      row(0).font_style = :bold
      row(-2).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [250, 170, 100]
    end
  end

  def text_content
    y_position = cursor - 10

    bounding_box([0, y_position], :width => 500) do
      text "#{@offer.comment}", size: 10, style: :normal
    end
  end


end
