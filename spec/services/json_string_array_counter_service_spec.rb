require 'rails_helper'

RSpec.describe JsonStringArrayCounterService do
  describe '.new' do
    context 'when any argument missing' do
      it 'raise an ArgumentError' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.call' do
    context 'when json string is parsable' do
      let(:json_content) do
        <<-JSON
          {
            "a": ["123", "abcd",1,3,1,12,21,11,[1,2,3,4,5,"a","b","c",11,2,3],21,23,1,2,3],
            "b": [1,2,3],
            "c": {
              "aa": ["123", "abcd",1,3,1,12,21,11,[1,2,3,4,5,"a","b","c",11,2,3],21,23,1,2,3],
              "bb": "Foo Bar Bazz Foo Bar Baz",
              "cc": [
                {
                  "aaa": [1,2,3,15,"foo", "foo", 22, "xyz",12,3,4,5,6]
                }
              ]
            }
          }
        JSON
      end

      it 'count char occurences in content' do
        stub_request(:get, 'http://example.com')
          .to_return(
            headers: {
              'Content-Type' => 'text/json'
            },
            body: json_content
          )

        counter = described_class.new(url: 'http://example.com')
        expect(counter.call).to eq(5)
        counter.min_elements = 1
        expect(counter.call).to eq(7)
      end
    end

    context 'when json string is broken' do
      let(:unparsable_json) do
        <<-JSON
          malformed json
        JSON
      end
      it 'raise service error' do
        stub_request(:get, 'http://example.com')
          .to_return(
            headers: {
              'Content-Type' => 'text/json'
            },
            body: unparsable_json
          )

        expect { described_class.new(url: 'http://example.com').call }
          .to raise_error(JsonStringArrayCounterService::ServiceError)
      end
    end
  end
end
