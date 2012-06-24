module Main where

import Control.Concurrent
import Network
import System.IO
import Control.Monad
import System.Environment

import Haborg
import Haborg.Network

main :: IO ()
main = withSocketsDo $ do
    args <- getArgs
    let name = head (args ++ ["imperian"])

    hdl <- connectTo (getHost name) $ getPort name

    hSetBuffering stdout NoBuffering
    hSetBuffering hdl NoBuffering

    forkIO $ hGetContents hdl >>= parse
    getContents >>= hPutStr hdl

parse :: String -> IO ()
parse str = mapM_ putStrLn (lines str)
