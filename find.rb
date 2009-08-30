Board.first.hexes.find_by_positions([[1, 1], [2, 2]])

# SELECT *
# FROM "hexes"
# WHERE (("hexes".row = 1 AND "hexes".col = 1) OR
#        ("hexes".row = 2 AND "hexes".col = 2) OR
#         0 = 1) AND
#        ("hexes".board_id = 1)

#=> [#<Hex id: 11, row: 2, col: 2, ...]
