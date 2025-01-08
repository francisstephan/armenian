module Trans_Ha exposing (transl)

import Dict

latEll = Dict.fromList [ ("a" , "\u{0561}")  
                        ,("b" , "\u{0562}")
                        ,("g" , "\u{0563}")
                        ,("d" , "\u{0564}")
                        ,("é" , "\u{0565}")
                        ,("z" , "\u{0566}")
                        ,("ê" , "\u{0567}")
                        ,("e" , "\u{0568}")
                        ,("t" , "\u{057F}"), ("t'", "\u{0569}")
                        ,("j" , "\u{056A}")
                        ,("i" , "\u{056B}")
                        ,("l" , "\u{056C}")
                        ,("x" , "\u{056D}")
                        ,("c" , "\u{056E}")
                        ,("k" , "\u{056F}")
                        ,("h" , "\u{0570}")
                        ,("g'" , "\u{0572}")
                        ,("ç" , "\u{0573}")
                        ,("m" , "\u{0574}")
                        ,("y" , "\u{0575}")
                        ,("n" , "\u{0576}")
                        ,("s'" , "\u{0577}")
                        ,("o" , "\u{0578}")
                        ,("ç'" , "\u{0579}")
                        ,("p" , "\u{057A}")
                        ,("r'" , "\u{057C}")
                        ,("s" , "\u{057D}")
                        ,("v" , "\u{057E}")
                        ,("r" , "\u{0580}")
                        ,("c'" , "\u{0581}")
                        ,("ô" , "\u{0585}")
                        ,("f" , "\u{0586}")
                        ,("w" , "\u{0582}")
                        ,("u" , "\u{0578}\u{0582}")
                        ,("p'" , "\u{0583}")
                        ,("k'" , "\u{0584}")
                        ,("ô'" , "\u{0585}")
                        ,("f'" , "\u{0586}")
                        ,("A" , "\u{0531}")
                        ,("B" , "\u{0532}")
                        ,("G" , "\u{0533}")
                        ,("D" , "\u{0534}")
                        ,("É" , "\u{0535}")
                        ,("Z" , "\u{0536}")
                        ,("Ê" , "\u{0537}")
                        ,("E" , "\u{0538}")
                        ,("T'" , "\u{0539}")
                        ,("J" , "\u{053A}")
                        ,("I" , "\u{053B}")
                        ,("L" , "\u{053C}")
                        ,("X" , "\u{053D}")
                        ,("C" , "\u{053E}")
                        ,("K" , "\u{053F}")
                        ,("H" , "\u{0540}")
                        ,("G'" , "\u{0542}")
                        ,("M" , "\u{0544}")
                        ,("Y" , "\u{0545}")
                        ,("N" , "\u{0546}")
                        ,("S'" , "\u{0547}")
                        ,("O" , "\u{0548}")
                        ,("P" , "\u{054A}")
                        ,("R'" , "\u{054C}")
                        ,("S" , "\u{054D}")
                        ,("V" , "\u{054E}")
                        ,("T" , "\u{054F}")
                        ,("R" , "\u{0550}")
                        ,("C'" , "\u{0551}")
                        ,("W" , "\u{0548}")
                        ,("U" , "\u{0548}\u{0552}")
                        ,("P'" , "\u{0553}")
                        ,("K'" , "\u{0554}")
                        ,("Ô" , "\u{0555}")
                        ,("F" , "\u{0556}")
                        , ("_" , "") -- filter _
                        ] 
latEll_= Dict.fromList  [ ("v" , "\u{0587}") -- yev --
                        , ("C" , "\u{0543}") -- TZA --
                        , ("C'" , "\u{0549}") -- TJA --
                        , ("c" , "\u{0573}")
                        , ("c'" , "\u{0579}")
                        , ("z" , "\u{0571}")
                        , ("j" , "\u{057B}")
                        , ("Z" , "\u{0541}")
                        , ("J" , "\u{054B}")
                        ]

diacritics : List String
diacritics = ["'"]

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
