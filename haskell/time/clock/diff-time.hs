import qualified Data.Time as T

main :: IO ()
main =
    do print $ T.secondsToDiffTime 0
       print $ T.secondsToDiffTime 1000
       print $ T.picosecondsToDiffTime 1000
       print $ T.picosecondsToDiffTime $ 1000 * 1000 * 1000
