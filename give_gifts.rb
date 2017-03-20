# Everyone gives and receives a gift.  [giver_id, receiver_id]
# Cant give gift to themselves
class GiveGifts
  attr_accessor :people, :pairs

  def initialize(input)
    # array of each persons ID.
    self.people = input
    self.pairs  = []
  end

  def perform
    return if people.length < 2
    receivers = people.dup # Doubles space complexity.

    people.length.times do
      giver, receiver = generate_gift_giving_pair(people, receivers)

      # TODO .deletes add to time complexity, optimize
      # A Set could speed things up.
      people.delete(giver)
      receivers.delete(receiver)

      pairs << [giver, receiver]
    end
  end

  def generate_gift_giving_pair(givers, receivers)
    return if givers.empty? || receivers.empty?

    # It can pick pairs such that the last element in each array
    # will be the same person
    if givers.length == 1 && givers == receivers
      handle_unluckiness(givers[0])
      return
    end

    giver, receiver = [givers.sample, receivers.sample]

    if giver == receiver
      generate_gift_giving_pair(givers, receivers)
    else
      return [giver, receiver]
    end
  end

  def handle_unluckiness(unlucky_person)
    # example starting state for three person input
    # [1,2], [2,1] and only person "3" is left to give a gift to themself
    # output is to shift values such that self.pairs becomes:
    # [1,2], [2,3], [3,1]

    last_pair      = pairs.last
    new_pair       = [unlucky_person, last_pair.last]
    last_pair[-1]  = unlucky_person
  end
end
