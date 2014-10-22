import qualified Data.Time as T

main :: IO ()
main =
    do add 1 (2014, 1, 1)
       add 1 (2014, 1, 2)
       add 1 (2014, 1, 28)
       add 1 (2014, 1, 29)
       add 1 (2014, 1, 30)
       add 1 (2014, 1, 31)
    where
      add n (y, m, d) =
          let t = T.fromGregorian y m d
          in print (t, T.addGregorianMonthsClip n t
                     , T.addGregorianMonthsRollOver n t)
