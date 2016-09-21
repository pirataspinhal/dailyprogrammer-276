import qualified Data.Map as Map

key :: (Ord k, Ord v) => (v -> v -> v) -> [v] -> [k] -> Map.Map k v
key function elements keys = fold_two (Map.insertWith function) Map.empty keys elements

fold_two :: (k -> v -> b -> b) -> b -> [k] -> [v] -> b
fold_two _ acc [] [] = acc
fold_two function accumulator (key:tkey) (elem:telem) = fold_two function (function key elem accumulator) tkey telem
