(TeX-add-style-hook "praca"
 (lambda ()
    (LaTeX-add-bibliographies)
    (LaTeX-add-labels
     "dice"
     "pioneers"
     "jsettlers"
     "railsarchitecture"
     "javascript"
     "pull"
     "longpolling"
     "streaming"
     "sec:board"
     "board"
     "nodes"
     "edges"
     "hexhexes"
     "hexnodes"
     "hexedges"
     "nodehexes"
     "nodenodes"
     "nodeedges"
     "edgehexes"
     "edgenodes"
     "edgeedges"
     "statemachine-phase"
     "statemachine-state"
     "erd")
    (TeX-add-symbols
     '("imref" 1)
     "UrlFont")
    (TeX-run-style-hooks
     "amsmath"
     "amsfonts"
     "url"
     "graphicx"
     "babel"
     "polish"
     "polski"
     "inputenc"
     "utf8"
     "latex2e"
     "art12"
     "article"
     "a4paper"
     "12pt"
     "pygments"
     "statemachine")))

