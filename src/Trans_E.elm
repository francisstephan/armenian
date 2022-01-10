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
                        ,("r" , "\u{03c1}"), ("rc" , "\u{1FE5}")
                        ,("s" , "\u{03c3}")
                        ,("t" , "\u{03c4}")
                        ,("u" , "\u{03c5}")
                        ,("f" , "\u{03c6}")
                        ,("h" , "\u{03c7}")
                        ,("ô" , "\u{03c9}")
                        ,("A" , "\u{0391}"), ("Ac","\u{1F09}"), ("Aq","\u{1F08}")
                        ,("B" , "\u{0392}")
                        ,("G" , "\u{0393}")
                        ,("D" , "\u{0394}")
                        ,("E" , "\u{0395}"), ("Ec","\u{1F19}"), ("Eq","\u{1F18}")
                        ,("Z" , "\u{0396}")
                        ,("Ê" , "\u{0397}"), ("Êc","\u{1F29}"), ("Êq","\u{1F28}")
                        ,("I" , "\u{0399}"), ("Ic","\u{1F39}"), ("Iq","\u{1F38}")
                        ,("K" , "\u{039a}")
                        ,("L" , "\u{039b}")
                        ,("M" , "\u{039c}")
                        ,("N" , "\u{039d}")
                        ,("X" , "\u{039e}")
                        ,("O" , "\u{039f}"), ("Oc","\u{1F49}"), ("Oq","\u{1F48}")
                        ,("P" , "\u{03a0}")
                        ,("R" , "\u{03a1}")
                        ,("S" , "\u{03a3}")
                        ,("T" , "\u{03a4}")
                        ,("U" , "\u{03a5}"), ("Uc","\u{1F59}")
                        ,("F" , "\u{03a6}")
                        ,("H" , "\u{03a7}")
                        ,("Ô" , "\u{03a9}"), ("Ôc","\u{1F69}"), ("Ôq","\u{1F68}")
                        ,("ac" , "\u{1F01}"), ("acâ", "\u{1F07}"), ("acç", "\u{1F81}"), ("acè", "\u{1F03}"), ("acé", "\u{1F05}")
                        ,("aq" , "\u{1F00}"), ("aqâ", "\u{1F06}"), ("aqç", "\u{1F80}"), ("aqè", "\u{1F02}"), ("aqé", "\u{1F04}")
                        ,("aâ" , "\u{1FB6}"), ("aâç", "\u{1FB7}"), ("açè", "\u{1FB2}"), ("açé", "\u{1FB4}")
                        ,("aç" , "\u{1FB3}"), ("acâç","\u{1F87}"), ("acçè","\u{1F83}"), ("acçé","\u{1F85}")
                        ,("aè" , "\u{1F70}"), ("aqâç","\u{1F86}"), ("aqçè","\u{1F82}"), ("aqçé","\u{1F84}")
                        ,("aé" , "\u{1F71}")
                        ,("ec" , "\u{1F11}"), ("ecè", "\u{1F13}"), ("ecé", "\u{1F15}"), ("eqè", "\u{1F12}"), ("eqé", "\u{1F14}")
                        ,("eq" , "\u{1F10}")
                        ,("eè" , "\u{1F72}")
                        ,("eé" , "\u{1F73}")
                        ,("êc" , "\u{1F21}"), ("êcâ", "\u{1F27}"), ("êcç", "\u{1F91}"), ("êcè", "\u{1F23}"), ("êcé", "\u{1F25}")
                        ,("êq" , "\u{1F20}"), ("êqâ", "\u{1F26}"), ("êqç", "\u{1F90}"), ("êqè", "\u{1F22}"), ("êqé", "\u{1F24}")
                        ,("êâ" , "\u{1FC6}"), ("êâç", "\u{1FC7}"), ("êçè", "\u{1FC2}"), ("êçé", "\u{1FC4}")
                        ,("êç" , "\u{1FC3}"), ("êcâç","\u{1F97}"), ("êcçè","\u{1F93}"), ("êcçé","\u{1F95}")
                        ,("êè" , "\u{1F74}"), ("êqâç","\u{1F96}"), ("êqçè","\u{1F92}"), ("êqçé","\u{1F94}")
                        ,("êé" , "\u{1F75}")
                        ,("ic" , "\u{1F31}"), ("icâ", "\u{1F37}"), ("icè", "\u{1F33}"), ("icé", "\u{1F35}")
                        ,("iq" , "\u{1F30}"), ("iqâ", "\u{1F36}"), ("iqè", "\u{1F32}"), ("iqé", "\u{1F34}")
                        ,("iâ" , "\u{1FD6}")
                        ,("iè" , "\u{1F76}")
                        ,("ié" , "\u{1F77}")
                        ,("oc" , "\u{1F41}"), ("ocè", "\u{1F43}"), ("océ", "\u{1F45}"), ("oqè", "\u{1F42}"), ("oqé", "\u{1F44}")
                        ,("oq" , "\u{1F40}")
                        ,("oè" , "\u{1F78}")
                        ,("oé" , "\u{1F79}")
                        ,("uc" , "\u{1F51}"), ("ucâ", "\u{1F57}"), ("ucè", "\u{1F53}"), ("ucé", "\u{1F55}")
                        ,("uq" , "\u{1F50}"), ("uqâ", "\u{1F56}"), ("uqè", "\u{1F52}"), ("uqé", "\u{1F54}")
                        ,("uâ" , "\u{1FE6}")
                        ,("uè" , "\u{1F7A}")
                        ,("ué" , "\u{1F7B}")
                        ,("ôc" , "\u{1F61}"), ("ôcâ", "\u{1F67}"), ("ôcç", "\u{1FA1}"), ("ôcè", "\u{1F63}"), ("ôcé", "\u{1F65}")
                        ,("ôq" , "\u{1F60}"), ("ôqâ", "\u{1F66}"), ("ôqç", "\u{1FA0}"), ("ôqè", "\u{1F62}"), ("ôqé", "\u{1F64}")
                        ,("ôâ" , "\u{1FF6}"), ("ôâç", "\u{1FF7}"), ("ôçè", "\u{1FF2}"), ("ôçé", "\u{1FF4}")
                        ,("ôç" , "\u{1FF3}"), ("ôcâç","\u{1FA7}"), ("ôcçè","\u{1FA3}"), ("ôcçé","\u{1FA5}")
                        ,("ôè" , "\u{1F7C}"), ("ôqâç","\u{1FA6}"), ("ôqçè","\u{1FA2}"), ("ôqçé","\u{1FA4}")
                        ,("ôé" , "\u{1F7D}")
                        , ("_" , "") -- filter _
                        ] 
latEll_= Dict.fromList  [ ("t" , "\u{03b8}") -- theta --  
                        , ("s" , "\u{03c2}") -- sigma final --  
                        , ("p" , "\u{03c8}") -- psi --
                        , ("T" , "\u{0398}") -- Theta --
                        , ("P" , "\u{03a8}") -- Psi --
                        ]

diacritics : List String
diacritics = ["c", "q", "â", "ç", "è", "é"]

subst : String -> (Dict.Dict String String) -> String -- substitute one char (or char + diacritics) on the basis of dictionary
subst car dict =
  Maybe.withDefault car (Dict.get car dict) -- if car is in dict, substitute, else keep car

subst_ : (String,String) -> String -- select dictionary on the basis of previous char : _ or not _, and substitute char
subst_ dble =
  let
     (carac, sub) = dble
  in
    if sub == "_" then subst carac latEll_ else subst carac latEll

szip : List String -> List (String,String) -- zip s with a right shift of itself
szip s =
    List.map2 Tuple.pair s ("&" :: s)

foldp : List String -> List String -> List String -- concatenate letters with their diacritics, if any
foldp acc list =
  case list of
    [] ->
      acc
    x::xs ->
      case xs of
        [] -> 
          x::acc
        y::ys ->
          if List.member y diacritics then -- 1 diacritic
            case ys of
              [] ->
                (x++y)::acc
              z::zs ->
                if List.member z diacritics then -- 2 diacritics
                  case zs of
                    [] ->
                      (x++y++z)::acc
                    w::ws ->
                      if List.member w diacritics then -- 3 diacritics 
                        foldp ((x++y++z++w)::acc) ws
                      else
                        foldp ((x++y++z)::acc) zs
                else
                  foldp ((x++y)::acc) ys
          else
            foldp (x::acc) xs

trich : String -> String -- sort diacritics, if more than 1 present
trich s =
  if String.length s < 3 then s -- 0 or 1 diacritic, no need to sort
  else
    let 
      h = String.slice 0 1 s -- head character, should be vowel or r
      b = String.slice 1 5 s -- b contains the diacritics, which will be sorted according to Unicode value
    in
      h ++ (b |> String.toList |> List.map String.fromChar |> List.sort |> List.foldr (++) "")

transl : String -> String
transl chaine =
    chaine
    |> String.toList
    |> List.map String.fromChar
    |> foldp [] 
    |> List.reverse 
    |> List.map trich
    |> szip
    |> List.map subst_
    |> List.foldr (++) ""
