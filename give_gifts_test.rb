require './give_gifts'
require 'rspec/its'

describe GiveGifts do
  let(:action) { described_class.new(input) }

  describe "#perform" do
    subject { action.pairs }
    before  { action.perform }

    context 'no people' do
      let(:input) { [] }
      it { is_expected.to be_empty }
    end

    context 'one person' do
      let(:input) { [1] }
      it { is_expected.to be_empty }
    end

    context 'two people' do
      let(:input) { [1,2] }
      it { is_expected.to include([1,2]) }
      it { is_expected.to include([2,1]) }
      its(:length) { is_expected.to eq(2) }
    end

    context 'three people' do
      let(:input) { [1,2,3] }
      its(:length) { is_expected.to eq(3) }

      it 'doesnt ever have a giver receiver pair be the same person' do
        subject.each { |pair| expect(pair.uniq.length).to eq(2) }
      end
    end

    context 'four people' do
      let(:input) { [1,2,3,4] }
      its(:length) { is_expected.to eq(4) }

      it 'doesnt ever have a giver receiver pair be the same person' do
        subject.each { |pair| expect(pair.uniq.length).to eq(2) }
      end
    end
  end
end
