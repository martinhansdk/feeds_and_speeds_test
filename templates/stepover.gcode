( {{ autogenerate_warning }} )

( This is suitable for testing a variety of stepovers. To try different depth of cuts, use depth_of_cut.gcode instaead. )
(                                                                                                          )
(                                                                                                          )
( +-------------------------------------------------------------------------------+                        )
( |                                                                               |                        )
( |                                                                               |                        )
( |                                                                               |                        )
( |                Work piece                                                     |                        )
( |                                                                               |                        )
( |                                                                               |                        )
( +-------------------------------------------------------------------------------+ +---+                  )
(                                                                                   |   |                  )
(                                                                                   +---+                  )
(                                                                                                          )
(    |<--------------------------- trace_length ----------------------------------->|                      )
(                                                                                                          )
( Put the tool like this with Z height = top of stock, Y such that tool touches side of stock.             )
( The cut advaces to the left.                                                                             )

(Relative coordinates)
G91

(Spindle on)
M3

(Move down to working height)
G01 Z{{ -cut_depth }}

(Apply {{stepover}}mm stepover)
G01 Y{{ stepover }}

(Cut a trace)
G01 X{{ trace_length }}

(Move away from work piece)
G01 Y{{ -stepover }} Z{{ cut_depth }}

(Go to starting position for next cut - same X and Z position that we started at, but further up on the Y axis)
G00 X{{ -trace_length }}
G01 Y{{ stepover }}

(Spindle off)
M3
