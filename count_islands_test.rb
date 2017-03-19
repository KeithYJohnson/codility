require './count_islands'

describe CountIslands do
  let(:action) { described_class.new(input) }
  let(:input) do
    [
      [0,1,0,0],
      [0,1,0,0],
      [0,1,0,0],
      [0,1,0,0]
    ]
  end

  context 'nil input' do
    let(:input) { nil }
    subject     { action.perform }
    it          { is_expected.to eq(0) }
  end

  context 'empty array input' do
    let(:input) { [] }
    subject     { action.perform }
    it          { is_expected.to eq(0) }
  end


  context 'empty nested array input' do
    let(:input) { [[]] }
    subject     { action.perform }
    it          { is_expected.to eq(0) }
  end

  context 'one long island' do
    subject { action.num_islands }
    before  { action.perform }
    it      { is_expected.to eq(1) }
  end

  context 'two islands' do
    let(:input) {
      [
        [0,1,0,1],
        [1,1,0,1],
        [1,0,0,1], #Testing that diagonals arent 'contiguous'.  Will break if [1,1] etc is added to contiguous_directions
        [0,1,1,1]
      ]
    }
    subject { action.num_islands }
    before  { action.perform }
    it      { is_expected.to eq(2) }
  end

  describe "#explore" do
    subject { action.map }
    before  { action.explore(1, 1) }

    context '1 straight line island' do
      let(:expected) {
        [
          [0,2,0,0],
          [0,2,0,0],
          [0,2,0,0],
          [0,2,0,0]
        ]
      }
      it { is_expected.to eq(expected) }
    end

    context 'not a line' do
      let(:input) {
        [
          [0,1,0,1],
          [1,1,1,1],
          [0,1,0,1],
          [0,1,0,0]
        ]
      }

      let(:expected) {
        [
          [0,2,0,2],
          [2,2,2,2],
          [0,2,0,2],
          [0,2,0,0]
        ]
      }

      it  { is_expected.to eq(expected) }
    end

    context 'more than one island' do
      let(:input) {
        [
          [0,1,0,1],
          [1,1,0,1],
          [0,1,0,1],
          [0,1,0,0]
        ]
      }

      let(:expected) {
        [
          [0,2,0,1],
          [2,2,0,1],
          [0,2,0,1],
          [0,2,0,0]
        ]
      }

      it  { is_expected.to eq(expected) }
    end
  end

  describe "#coords_in_bound" do
    it 'returns the correct response at the boundaries' do
      expect(action.coords_in_bound?(0, 0)).to be_truthy
      expect(action.coords_in_bound?(0, 3)).to be_truthy
      expect(action.coords_in_bound?(3, 0)).to be_truthy

      expect(action.coords_in_bound?(-1,  0)).to be_falsey
      expect(action.coords_in_bound?( 4,  0)).to be_falsey
      expect(action.coords_in_bound?( 0, -1)).to be_falsey
      expect(action.coords_in_bound?( 0,  4)).to be_falsey
    end
  end
end
