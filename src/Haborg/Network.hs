module Haborg.Network where

import Network

getAddr :: String -> (String, Integer)
getAddr name
    | name == "imperian" = ("imperian.com", 23)
    | otherwise          = ("", 0)

getHost :: String -> String
getHost name = fst $ getAddr name

getPort :: String -> PortID
getPort name = PortNumber $ fromIntegral $ snd $ getAddr name
