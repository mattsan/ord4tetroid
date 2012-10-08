import Data.Char
import Data.List

c2i = subtract 48.ord

str2pos [x0, y0, ',', x1, y1, ',', x2, y2, ',', x3, y3] =
  [(c2i x0, c2i y0), (c2i x1, c2i y1), (c2i x2, c2i y2), (c2i x3, c2i y3)]

normalize ps = sort $ foldl (\xs (x, y) -> (x - xmin, y - ymin):xs) [] ps
  where
    xmin = minimum $ map fst ps
    ymin = minimum $ map snd ps

tetromino [ (0, 0), (0, 1), (0, 2), (1, 2) ] = "L"
tetromino [ (0, 0), (0, 1), (1, 0), (2, 0) ] = "L"
tetromino [ (0, 0), (1, 0), (1, 1), (1, 2) ] = "L"
tetromino [ (0, 1), (1, 1), (2, 0), (2, 1) ] = "L"
tetromino [ (0, 0), (0, 1), (1, 1), (2, 1) ] = "L"
tetromino [ (0, 0), (0, 1), (0, 2), (1, 0) ] = "L"
tetromino [ (0, 0), (1, 0), (2, 0), (2, 1) ] = "L"
tetromino [ (0, 2), (1, 0), (1, 1), (1, 2) ] = "L"
tetromino [ (0, 0), (1, 0), (2, 0), (3, 0) ] = "I"
tetromino [ (0, 0), (0, 1), (0, 2), (0, 3) ] = "I"
tetromino [ (0, 0), (1, 0), (1, 1), (2, 0) ] = "T"
tetromino [ (0, 0), (0, 1), (0, 2), (1, 1) ] = "T"
tetromino [ (0, 1), (1, 0), (1, 1), (2, 1) ] = "T"
tetromino [ (0, 1), (1, 0), (1, 1), (1, 2) ] = "T"
tetromino [ (0, 0), (0, 1), (1, 0), (1, 1) ] = "O"
tetromino [ (0, 0), (0, 1), (1, 1), (1, 2) ] = "S"
tetromino [ (0, 1), (0, 2), (1, 0), (1, 1) ] = "S"
tetromino [ (0, 1), (1, 0), (1, 1), (2, 0) ] = "S"
tetromino [ (0, 0), (1, 0), (1, 1), (2, 1) ] = "S"
tetromino _                                  = "-"

main = getContents >>= putStrLn.unlines.map (tetromino.normalize.str2pos).lines