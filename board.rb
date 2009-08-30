Board.create!(:size => [2, 2],
              :robber_position => [1, 0],
              :hexes_attributes => [
                                    {
                                      :position => [0, 0],
                                      :hex_type => "sea",
                                      :harbor_type => "generic",
                                      :harbor_position => 5
                                    },
                                    {
                                      :position => [0, 1],
                                      :hex_type => "forest",
                                      :roll => 6
                                    },
                                    {
                                      :position => [1, 0],
                                      :hex_type => "desert"
                                    },
                                    {
                                      :position => [1, 1],
                                      :hex_type => "hill",
                                      :roll => 8
                                    }
                                   ]
              )
