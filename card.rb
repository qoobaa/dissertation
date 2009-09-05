class Card < ActiveRecord::Base
  # ...

  state_machine :initial => :tapped do
    event :untap do
      transition :tapped => :untapped
    end

    before_transition :on => :untap, :do => :before_untap

    event :play do
      transition :untapped => :graveyard
    end

    before_transition :on => :play, :do => :before_play
  end

  # ...
end
