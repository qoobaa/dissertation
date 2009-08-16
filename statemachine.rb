state_machine :initial => :preparing do
  event :start_game do
    transition :preparing => :playing
  end

  event :end_game do
    transition :playing => :ended, :if => :winner?
  end

  state :playing do
    validates_length_of :players, :in => 3..4
    validates_presence_of :board
    validate :players_ready
  end

  before_transition :on => :start_game do |game|
    game.reset_robber
    game.reset_card
    game.deal_resources
    game.largest_army_size = 2
    game.longest_road_length = 4
    game.current_turn = 1
    game.current_player = game.players.first
    game.army_cards = 14
    game.monopoly_cards = 2
    game.year_of_plenty_cards = 2
    game.road_building_cards = 2
    game.victory_point_cards = 5
  end
end
