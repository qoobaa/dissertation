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
    # ...
  end
end
