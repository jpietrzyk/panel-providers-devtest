class WebPageCharCounterService
  class ServiceError < StandardError; end

  attr_accessor :char
  attr_reader :char_count

  def initialize(url:, char: 'a')
    @url = url
    @char = char
  end

  def call
    @char_count = 0
    fetch_url
    read_content
    count_char_occurrences
  end

  private

  attr_reader :url, :content, :scrapper, :page

  def fetch_url
    @scrapper ||= Mechanize.new
    @page ||= scrapper.get(url)
  rescue StandardError => e
    raise ServiceError, "Can't open #{url}. Details: #{e.message}"
  end

  def read_content
    @content ||= page.at('body').text
  end

  def count_char_occurrences
    @char_count = content.count(char)
  end
end
