require 'rails_helper'

RSpec.describe PanelPriceService do
  describe '.new' do
    context 'when any argument missing' do
      it 'raise an ArgumentError' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.call' do
    context 'when all arguments provided' do
      include_context :json_content
      include_context :html_content
      let(:provider_type_urls) do
        {
          p1: 'http://example.com',
          p2: 'http://example.com',
          p3: 'http://example.com'
        }
      end
      it 'calculate price valid for provider 1' do
        stub_request(:get, 'http://example.com')
          .to_return(
            headers: {
              'Content-Type' => 'text/html'
            },
            body: html_content
          )
        calculator = described_class.new(
          provider_type: 1,
          qty: 50,
          provider_type_urls: provider_type_urls
        )
        expect(calculator.call).to eq(2.5)
      end

      it 'calculate price valid for provider 2' do
        stub_request(:get, 'http://example.com')
          .to_return(
            headers: {
              'Content-Type' => 'text/json'
            },
            body: json_content
          )
        calculator = described_class.new(
          provider_type: 2,
          qty: 50,
          provider_type_urls: provider_type_urls
        )
        expect(calculator.call).to eq(250)
      end

      it 'calculate price valid for provider 3' do
        stub_request(:get, 'http://example.com')
          .to_return(
            headers: {
              'Content-Type' => 'text/html'
            },
            body: html_content
          )
        calculator = described_class.new(
          provider_type: 3,
          qty: 50,
          provider_type_urls: provider_type_urls
        )
        expect(calculator.call).to eq(3.5)
      end
    end
  end
end
