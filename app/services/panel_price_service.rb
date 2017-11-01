class PanelPriceService
  class ServiceError < StandardError; end

  attr_accessor :qty
  attr_reader :price

  def initialize(provider_type:, qty:, provider_type_urls: nil)
    @provider_type = provider_type
    @qty = qty
    default_provider_urls = {
      p1: 'http://time.com',
      p2: 'http://openlibrary.org/search.json?q=the+lord+of+the+rings',
      p3: 'http://time.com'
    }
    @provider_type_urls = provider_type_urls || default_provider_urls
  end

  def call
    calculate_unit_price
    calculate_price
  end

  private

  attr_reader :provider_type, :unit_price, :provider_type_urls

  def calculate_unit_price
    @unit_price = case provider_type
                  when 1
                  then WebPageCharCounterService
                  .new(url: provider_type_urls[:p1])
                  .call.to_f / 100.0
                  when 2
                  then JsonStringArrayCounterService
                  .new(url: provider_type_urls[:p2])
                  .call
                  when 3
                  then WebPageHtmlNodesCounterService
                  .new(url: provider_type_urls[:p3])
                  .call.to_f / 100.0
                  else
                    raise ServiceError,
                          "Unknown provider type: #{provider_type}"
                  end
  end

  def calculate_price
    (unit_price * qty).round(2)
  end
end
