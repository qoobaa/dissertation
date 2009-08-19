state_machine :phase, :initial => :first_settlement do
  event :settlement_built do
    transition :first_settlement => :first_road
    transition :second_settlement => :second_road
    transition :after_roll => :after_roll
  end

  before_transition :on => :settlement_built do |game, transition|
    game.playing? and game.current_user_turn?(*transition.args)
  end

  before_transition :on => :settlement_built, :do => :longest_road

  # ...
end
