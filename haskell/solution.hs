import qualified Data.Map as Map

key :: (Ord k, Ord v) => (v -> v -> v) -> [v] -> [k] -> Map.Map k v
key fun elems keys = fold_two (Map.insertWith fun) Map.empty keys elems

fold_two :: (k -> v -> b -> b) -> b -> [k] -> [v] -> b
fold_two _ acc [] []
  = acc
fold_two fun acc (key:keys) (elem:elems)
  = fold_two fun (fun key elem acc) keys elems
