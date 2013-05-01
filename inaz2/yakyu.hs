import System.Environment
import System.IO
import System.Exit
import Data.List

yakyu1 [o,2,_] 's' = [(o+1) `mod` 3, 0, 0]
yakyu1 [o,s,b] 's' = [o, s+1, b]
yakyu1 [o,_,3] 'b' = [o, 0, 0]
yakyu1 [o,s,b] 'b' = [o, s, b+1]
yakyu1 [o,s,b] 'f' = [o, min (s+1) 2, b]
yakyu1 [o,_,_] 'h' = [o, 0, 0]
yakyu1 [o,_,_] 'p' = [(o+1) `mod` 3, 0, 0]

yakyu xs = intercalate "," . map (concatMap show) . tail $ scanl yakyu1 [0,0,0] xs

main = do
    args <- getArgs
    if null args
        then do
            progName <- getProgName
            hPutStrLn stderr $ "Usage: runghc " ++ progName ++ " STRING"
            exitFailure
        else do
            let xs = head args
            putStrLn $ yakyu xs
