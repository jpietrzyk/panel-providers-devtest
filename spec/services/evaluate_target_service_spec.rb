require 'rails_helper'

RSpec.describe EvaluateTargetService do
  describe '.new' do
    context 'when any argument missing' do
      it 'raise an ArgumentError' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end
end
