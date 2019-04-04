require 'rails_helper'

describe Compute::ComputeService, type: :model do
  describe '#compute' do
    let(:data) do
      [
        { title: 'Title1', values: [0, 3, 5, 6, 2, 9] },
        { title: 'Title2', values: [6, 3, 1, 3, 9, 4] }
      ]
    end

    subject { described_class.new(data) }
    context 'equal size arrays' do
      it 'should subtract second values arrays from first element by element' do
        expect(subject.compute).to eq [-6, 0, 4, 3, -7, 5]
      end
    end

    context 'different size array' do
      context 'first array is greater then second' do
        let(:data) do
          [
            { title: 'Title1', values: [0, 3, 5, 6, 2, 9] },
            { title: 'Title2', values: [6, 3, 1, 3] }
          ]
        end

        it 'should process part of first array' do
          expect(subject.compute).to eq [-6, 0, 4, 3, 2, 9]
        end
      end

      context 'second array is less then first' do
        let(:data) do
          [
            { title: 'Title1', values: [0, 3, 5, 6] },
            { title: 'Title2', values: [6, 3, 1, 3, 9, 4] }
          ]
        end

        it 'should process first array and part of secon array' do
          expect(subject.compute).to eq [-6, 0, 4, 3]
        end
      end
    end
  end
end