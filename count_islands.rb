class CountIslands
  attr_accessor :map, :num_islands, :contiguous_directions

  def initialize(input, contiguous_directions=[[0,1],[0,-1],[1,0],[-1,0]])
    self.map         = input
    self.num_islands = 0
    self.contiguous_directions = contiguous_directions
  end

  def perform
    return num_islands unless map && !map.flatten.empty?

    map.each_with_index do |row, yidx|
      row.each_with_index do |loc, xidx|
        if loc == 1
          self.num_islands += 1
          explore(xidx, yidx)
        end
      end
    end
  end

  def explore(x, y)
    if coords_in_bound?(x,y) && map[y][x] == 1
      map[y][x] = 2
      contiguous_directions.each do |dir|
        # TODO
        # Ruby GC and recursion are weird
        # doing x += dx and y += dy will give
        # you very very odd bugs.  Figure out why.
        dx, dy = dir
        new_x = x + dx
        new_y = y + dy
        explore(new_x, new_y)
      end
    end
  end

  def coords_in_bound?(x, y)
    x.between?(0, map[0].length - 1) &&
    y.between?(0, map.length - 1)
  end
end
