module Haborg
( Row(..)
, Character(..)
) where

import Test.HUnit
import Test.QuickCheck


-- Row

data Row = Prompt String | Line String

readRow :: String -> Row
readRow str = if isPrompt str then Prompt str else Line str

isPrompt :: String -> Bool
isPrompt str = isPrompt' False str

isPrompt' :: Bool -> String -> Bool
isPrompt' is "\255\249" = True
isPrompt' is [] = False
isPrompt' is (x:xs) = isPrompt' is xs

parse :: Row -> String
parse (Prompt row) = ""
parse (Line row) = ""


--- Character

data Character = Character { health :: Int }


-- Tests

tests = TestList $ map TestCase [
	assertEqual "Rows ending in GO AHEAD are prompts"
		(isPrompt "row\255\249") True
	, assertEqual "Rows ending in newline are not prompts"
		(isPrompt "row\n") False
	]

prop_empty c1 = (c1::Int) == c1

runTests = do
	runTestTT tests
	quickCheck prop_empty

main :: IO ()
main = runTests
