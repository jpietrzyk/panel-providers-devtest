class WebPageHtmlNodesCounterService
  class ServiceError < StandardError; end

  def initialize(url:)
    @url = url
  end

  def call
    fetch_content
    count_nodes
  end

  private

  attr_reader :url, :document, :scrapper

  def fetch_content
    scrapper = @scrapper || Mechanize.new
    @document = scrapper.get(url)
  rescue StandardError => e
    raise ServiceError, "Can't open #{url}. Details: #{e.message}"
  end

  def count_nodes
    document.xpath('//*').count
  end
end
