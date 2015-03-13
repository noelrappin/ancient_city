class TripPresenter < SimpleDelegator

  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::NumberHelper

  def initialize(trip)
    super(trip)
  end

  def date_range_display
    "#{start_date.to_s(:long)} - #{end_date.to_s(:long)}"
  end

  def link_to_trip_show_page
    link_to(name, Rails.application.routes.url_helpers.trip_path(__getobj__))
  end

  def main_page_image_tag
    image_tag("/assets/#{image_name}", height: 150, width: 150)
  end

  def price_display
    number_to_currency(price)
  end
end
