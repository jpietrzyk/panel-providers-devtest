class JsonStringArrayCounterService
  class ServiceError < StandardError; end

  attr_accessor :min_elements
  attr_reader :count

  def initialize(url:, min_elements: 11)
    @url = url
    @min_elements = min_elements
    @count = nil
  end

  def call
    fetch_json
    parse_json
    look_for_arrays
    count
  end

  private

  attr_accessor :url, :json_string, :parsed_json

  def fetch_json
    uri = URI(url)
    @json_string = Net::HTTP.get(uri)
  rescue StandardError => e
    raise ServiceError, "Cant fetch content from #{url}. Details: #{e.message}"
  end

  def parse_json
    @parsed_json = JSON.parse(json_string)
  rescue JSON::ParserError => e
    raise ServiceError, "Can't parse JSON at #{url}. Details: #{e.message}"
  end

  def look_for_arrays
    @count = 0
    find_all_requested_arrays(parsed_json.values)
  end

  def find_all_requested_arrays(elements)
    sub_elements = elements.select { |el| el.is_a?(Array) || el.is_a?(Hash) }
    return if sub_elements.empty?
    sub_elements.map do |el|
      @count += 1 if el.is_a?(Array) && el.size >= min_elements
      el = el.values if el.is_a? Hash
      find_all_requested_arrays(el)
    end
  end
end
