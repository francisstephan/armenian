module Trans_E exposing (transl)

import Dict

latEll = Dict.fromList [ ("a" , "\u{03b1}")  
                        ,("b" , "\u{03b2}")
                        ,("g" , "\u{03b3}")
                        ,("d" , "\u{03b4}")
                        ,("e" , "\u{03b5}")
                        ,("z" , "\u{03b6}")
                        ,("ê" , "\u{03b7}")
                        ,("i" , "\u{03b9}")
                        ,("k" , "\u{03ba}")
                        ,("l" , "\u{03bb}")
                        ,("m" , "\u{03bc}")
                        ,("n" , "\u{03bd}")
                        ,("x" , "\u{03be}")
                        ,("o" , "\u{03bf}")
                        ,("p" , "\u{03c0}")
                        ,("r" , "\u{03c1}")
                        ,("s" , "\u{03c3}")
                        ,("t" , "\u{03c4}")
                        ,("u" , "\u{03c5}")
                        ,("f" , "\u{03c6}")
                        ,("h" , "\u{03c7}")
                        ,("ô" , "\u{03c9}")
                        ,("A" , "\u{0391}")
                        ,("B" , "\u{0392}")
                        ,("G" , "\u{0393}")
                        ,("D" , "\u{0394}")
                        ,("E" , "\u{0395}")
                        ,("Z" , "\u{0396}")
                        ,("Ê" , "\u{0397}")
                        ,("I" , "\u{0399}")
                        ,("K" , "\u{039a}")
                        ,("L" , "\u{039b}")
                        ,("M" , "\u{039c}")
                        ,("N" , "\u{039d}")
                        ,("X" , "\u{039e}")
                        ,("O" , "\u{039f}")
                        ,("P" , "\u{03a0}")
                        ,("R" , "\u{03a1}")
                        ,("S" , "\u{03a3}")
                        ,("T" , "\u{03a4}")
                        ,("U" , "\u{03a5}")
                        ,("F" , "\u{03a6}")
                        ,("H" , "\u{03a7}")
                        ,("Ô" , "\u{03a9}")
                        ,("é" , "\u{0301}") -- aigü --
                        ,("è" , "\u{0300}") -- grave --
                        ,("â" , "\u{0311}") -- circonflexe --
                        ,("ç" , "\u{0328}") -- iota souscrit --
                        ,("q" , "\u{0313}") -- esprit doux --
                        , ("_" , "") -- filter _
                        ] 
latEll_= Dict.fromList [ ("t" , "\u{03b8}") -- theta --  
                        , ("s" , "\u{03c2}") -- sigma final --  
                        , ("p" , "\u{03c8}") -- psi --
                        , ("T" , "\u{0398}") -- Theta --
                        , ("P" , "\u{03a8}") -- Psi --
                        , ("r" , "\u{1fe5}") -- rho esprit rude --
                        , ("a" , "\u{1F01}") -- a esprit rude --
                        , ("e" , "\u{1F11}") -- e esprit rude --
                        , ("ê" , "\u{1F21}") -- eta esprit rude --
                        , ("i" , "\u{1F31}") -- i esprit rude --
                        , ("o" , "\u{1F41}") -- o esprit rude --
                        , ("u" , "\u{1F51}") -- u esprit rude --
                        , ("ô" , "\u{1F61}") -- omega esprit rude --
                        ]

subst : String -> (Dict.Dict String String) -> String
subst car dict =
  Maybe.withDefault car (Dict.get car dict)

subst_ : (String,String) -> String
subst_ dble =
  let
     (carac, sub) = dble
  in
    if sub == "_" then subst carac latEll_ else subst carac latEll

szip : String -> List (String,String)
szip s =
  let
    ls = s |> String.toList |> List.map String.fromChar
  in
    List.map2 Tuple.pair ls ("&" :: ls)

transl : String -> String
transl chaine =
  szip chaine
   |> List.map subst_
   |> List.foldr (++) ""
