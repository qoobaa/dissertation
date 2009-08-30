class Node < ActiveRecord::Base
  state_machine do
    event :settle do
      transition nil => :settlement
    end

    event :expand do
      transition :settlement => :city
    end

    before_transition :on => :settle, :do => :build_settlement
    before_transition :on => :expand, :do => :build_city
  end

  # ...
end
