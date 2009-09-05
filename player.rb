class Player < ActiveRecord::Base
  # ...

  state_machine :initial => :preparing do
    event :start do
      transition :preparing => :ready
    end

    event :play do
      transition :ready => :playing
    end

    after_transition :on => :start do |player|
      player.game_start_game
    end
  end

  # ...
end
