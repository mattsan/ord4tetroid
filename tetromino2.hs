import Data.Char
import Data.List

c2i = subtract 48.ord

dist x0 y0 x1 y1 = (x1 - x0) ^ 2 + (y1 - y0) ^ 2

str2pos (x0:y0:',':x1:y1:',':x2:y2:',':x3:y3:[]) =
  [(c2i x0, c2i y0), (c2i x1, c2i y1), (c2i x2, c2i y2), (c2i x3, c2i y3)]

pattern = unwords.map show.sort.pattern'.str2pos
  where
    pattern' [] = []
    pattern' ((x, y):ps) = (foldl (\xs (x1, y1) -> (dist x y x1 y1):xs) [] ps) ++ pattern' ps

solve x = case pattern x of "1 1 1 2 4 5" -> "L"
                            "1 1 1 4 4 9" -> "I"
                            "1 1 1 2 2 4" -> "T"
                            "1 1 1 1 2 2" -> "O"
                            "1 1 1 2 2 5" -> "S"
                            _             -> "-"

main = getContents >>= putStrLn.unlines.map solve.lines