class Edge < ActiveRecord::Base
  # ...

  def longest_road(visited_roads = Set.new, skip_roads = Set.new)
    visited_roads << self

    # left roads
    unvisited_left_roads =
      Set.new(left_roads) - visited_roads - skip_roads

    left_road_lenghts = unvisited_left_roads.map do |road|
      lenght, new_visited_roads =
        road.longest_road(visited_roads, unvisited_left_roads)

      visited_roads += new_visited_roads
      lenght
    end

    # right roads
    unvisited_right_roads =
      Set.new(right_roads) - visited_roads - skip_roads

    right_road_lenghts = unvisited_right_roads.map do |road|
      lenght, new_visited_roads =
        road.longest_road(visited_roads, unvisited_right_roads)

      visited_roads += new_visited_roads
      lenght
    end

    longest_road = 1 +
      (left_road_lenghts.max or 0) +
      (right_road_lenghts.max or 0)

    [longest_road, visited_roads]
  end

  # ...
end
