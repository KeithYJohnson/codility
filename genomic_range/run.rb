require 'set'
require 'pry-byebug'
IMPACT_FACTORS = {
  A: 1,
  C: 2,
  G: 3,
  T: 4
}
P = [2, 5, 0]
Q = [4, 5, 6]
S = 'CAGCCTA'



def solution(sequence, queries_p, queries_q)
  idxs_by_impact = {
  }
  min_loads = []
  queries_p.zip(queries_q).each do |qp, qq|
    subsequence = sequence[qp..qq]
    min_loads << find_minimum_load(subsequence)
  end
  return min_loads
end

def find_minimum_load(sequence)
  min_impact = 5
  sequence.chars.each do |char|
    impact = IMPACT_FACTORS[char.to_sym]
    min_impact = impact if impact < min_impact
    return min_impact if min_impact == 1
  end
  min_impact
end


#  Cant remember where I found this below solution
def faster_solution(s, p, q)
  nucleotides_to_impact_factors =  { 'A' => 1, 'C' => 2, 'G' => 3, 'T' => 4 }
  sequence_of_impact_factors = s.each_char.map { |n| nucleotides_to_impact_factors[n] }
  idx = -1
  prefix_max_a_idxs = sequence_of_impact_factors.map.with_index { |f, i| idx = i if f == 1; idx }
  idx = -1
  prefix_max_c_idxs = sequence_of_impact_factors.map.with_index { |f, i| idx = i if f == 2; idx }
  idx = -1
  prefix_max_g_idxs = sequence_of_impact_factors.map.with_index { |f, i| idx = i if f == 3; idx }

  p sequence_of_impact_factors
  p prefix_max_a_idxs
  p prefix_max_c_idxs
  p prefix_max_g_idxs

  p.zip(q).map do |(i, j)|
    binding.pry
    if prefix_max_a_idxs[j] >= i
      1
    elsif prefix_max_c_idxs[j] >= i
      2
    elsif prefix_max_g_idxs[j] >= i
      3
    else
      4
    end
  end
end

faster_solution('CAGCCTA', [2, 5, 0], [4, 5, 6])
