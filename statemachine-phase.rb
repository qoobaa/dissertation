state_machine :phase, :initial => :first_settlement do
  event :settlement_built do
    transition :first_settlement => :first_road
    transition :second_settlement => :second_road
    transition :after_roll => :after_roll
  end

  before_transition :on => :settlement_built do |game, trans|
    game.playing? and game.current_user_turn?(*trans.args)
  end

  # ...

  event :road_built do
    transition :first_road =>
      :first_settlement, :if => :next_player?

    transition :first_road => :second_settlement
    transition :second_road =>
      :second_settlement, :if => :previous_player?

    transition :second_road => :before_roll
    transition :road_building_first_road =>
      :road_building_second_road

    transition :road_building_second_road =>
      :after_roll

    transition :after_roll => :after_roll
  end

  # ...
end
