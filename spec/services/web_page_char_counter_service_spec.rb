require 'rails_helper'

RSpec.describe WebPageCharCounterService do
  describe '.new' do
    context 'when any argument missing' do
      it 'raise an ArgumentError' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end

    describe '.call' do
      let(:html_content) do
        <<-HTML
          <!DOCTYPE html>
          <html>
            <head>
              <title>Foo abc</title>
            </head>
            <body>
              <div>Bar abcd baaz</div>
              <p><a href="foo.html">Link to a</a></p>
            </body>
          </html>
        HTML
      end
      it 'count char occurences in content' do
        stub_request(:get, 'http://example.com')
          .to_return(
            headers: {
              'Content-Type' => 'text/html'
            },
            body: html_content
          )
        counter = described_class.new(url: 'http://example.com', char: 'a')
        expect(counter.call).to eq(5)
        counter.char = 'b'
        expect(counter.call).to eq(2)
      end
    end

  end
end
